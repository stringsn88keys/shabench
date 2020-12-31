require 'benchmark'
require 'digest'
require 'json'
require 'benchmark'
require 'digest'

INITIAL='Message'
PREHASHFORMAT="#{INITIAL}%010d"
THREADS=(ENV['THREADS'] || 4).to_i
THREADITERATIONS=(ENV['THREADITERATIONS'] || 20000).to_i
SINGLE_TEST_VALUE='ROW'
MULTI_TEST_VALUE=(ENV['MULTITESTVALUE'] || 'ROW')

def bench_single
  run_time = Benchmark.realtime do
    counter = 0
    @source = ''
    @target = ''
    while true
      @source=PREHASHFORMAT % counter
      @digest=Digest::SHA512.base64digest(@source)
      break if @digest.start_with?(SINGLE_TEST_VALUE)
      counter += 1
    end

  end
  {source: @source, digest: @digest, time: run_time}
end

def check_hashes(start, iterations)
  Thread.current[:source] = ''
  Thread.current[:target] = ''
  iterations.times do |counter|
    Thread.current[:source] = PREHASHFORMAT % (counter + start)
    Thread.current[:digest] = Digest::SHA512.base64digest(Thread.current[:source])
    break if Thread.current[:digest].start_with?(MULTI_TEST_VALUE)
  end

  return nil unless Thread.current[:digest].start_with?(MULTI_TEST_VALUE)
  {source: Thread.current[:source], digest: Thread.current[:digest]}
end

def bench_multithread
  result = nil
  run_time = Benchmark.realtime do
    counter = 0
    result = catch(:done) do
      loop do
        counter
        threads = (0...THREADS).map do |i|
          t = Thread.new do
            Thread.current[:output] = check_hashes(counter + (THREADITERATIONS*i), THREADITERATIONS)
            if Thread.current[:output]
              threads.each { |t| t.kill unless t == Thread.current }
            end
          end
          t
        end
        counter += THREADS * THREADITERATIONS
        threads.each do |t|
          t.join
          unless t[:output].nil?
            throw :done, t[:output]
          end
        end
      end
    end
  end
  result.merge(time: run_time)
end

def lambda_handler(event:, context:)
  { statusCode: 200, body: JSON.generate(bench_single) }
end
p lambda_handler(event: 'e', context: 'c')

p bench_multithread
