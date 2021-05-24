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


# there are 340 undecillion hashes in 128-bit space
# but the permutations cover only 75 billion
run_time = Benchmark.realtime do
    enumerator = charset.permutation(7)
    counter=0

    loop do
        value_to_hash = enumerator.next.join
        counter += 1
        break if Digest::MD5.hexdigest(value_to_hash) == hash_search
    end
    puts counter
end

puts run_time
