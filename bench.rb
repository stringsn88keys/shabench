require 'benchmark'
require 'digest'
require 'json'
require 'benchmark'
require 'digest'

INITIAL='Message'

def lambda_handler(event:, context:)
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
    { statusCode: 200, body: JSON.generate({source: @source, digest: @digest, times: times}) }
end

p lambda_handler(event: 'e', context: 'c')
