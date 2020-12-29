require 'benchmark'
require 'digest'
require 'json'
require 'benchmark'
require 'digest'

INITIAL='Message'
PREHASHFORMAT="#{INITIAL}%010d"
THREADS=ENV['THREADS'] || 4
THREADITERATIONS=ENV['THREADITERATIONS'] || 1000
SINGLE_TEST_VALUE='ROW'

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

def bench_multithread
  run_time = Benchmark.realtime do
    counter = 0 
    (0...THREADS).each do
      Thread.new { Thread.current[:output] = check_hashes(counter, THREADITERATIONS, )}
      counter += THREADITERATIONS
    end
  end
end

def lambda_handler(event:, context:)
  { statusCode: 200, body: JSON.generate(bench_single) }
end
p lambda_handler(event: 'e', context: 'c')
