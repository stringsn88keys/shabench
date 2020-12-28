require 'benchmark'
require 'digest'
require 'json'
require 'benchmark'
require 'digest'

INITIAL='Message'

def bench_single
    times = Benchmark.realtime do
      counter = 0
      @source = ''
      @target = ''
      while true
        @source="#{INITIAL}%010d" % counter
        @digest=Digest::SHA512.base64digest(@source)
        break if @digest.start_with?('ROW')
        counter += 1
      end

    end
    {source: @source, digest: @digest, times: times}
end

def lambda_handler(event:, context:)
  { statusCode: 200, body: JSON.generate(bench_single) }
end
p lambda_handler(event: 'e', context: 'c')
