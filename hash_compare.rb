require 'benchmark'
require 'digest'

charset=(' '..'~').to_a

enumerator = charset.permutation(8)
run_time = Benchmark.realtime do
    1_000_000.times do
        Digest::MD5.hexdigest(enumerator.next.join)
    end
end

p run_time

enumerator = charset.permutation(8)
run_time = Benchmark.realtime do
    1_000_000.times do
        Digest::SHA256.hexdigest(enumerator.next.join)
    end
end

p run_time

enumerator = charset.permutation(8)
run_time = Benchmark.realtime do
    1_000_000.times do
        Digest::SHA512.hexdigest(enumerator.next.join)
    end
end

p run_time

enumerator = charset.permutation(8)
value_to_hash = enumerator.next.join

md5 = Digest::MD5.hexdigest(value_to_hash)
sha256 = Digest::SHA256.hexdigest(value_to_hash)
sha512 = Digest::SHA512.hexdigest(value_to_hash)

puts md5
puts sha256
puts sha512

hash_search='aec7c2edfdb560ec9e605a5b2354396e'
password='Orange1'


run_time = Benchmark.realtime do
    (2**31 - 1).times do |i|
        Digest::MD5.hexdigest("%10d" % i)
    end
end

puts run_time
