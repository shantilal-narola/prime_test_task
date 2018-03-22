class PrimeAssignment
  def isPrime n
    for d in 2..(n - 1)
      return false if (n % d) == 0
    end
    true
  end
  def fetchPrimeArray limit
    prime_numbers = []
    start_prime = limit <= 101 ? 2 : 6
    start_prime.upto(limit) { |a| prime_numbers << a if isPrime(a)  }
    return prime_numbers
  end
  def maxPrimeSum n
    limit = n
    primes = fetchPrimeArray(limit)
    prime_sum = max_prime_sum = prime_tot = 0
    consists_prime_array = []
    primes.each do |p|
      prime_sum += p
      max_prime_sum = prime_sum if prime_sum <= limit && isPrime(prime_sum)
    end
    primes.each do |p|
      prime_tot += p
      consists_prime_array << p
      break if prime_tot > max_prime_sum
    end
    consists_prime_array.pop
    p "The longest sum of consecutive primes below #{limit}  that adds to a prime, contains #{(consists_prime_array.count)} terms, and is equal to #{max_prime_sum}"
    p " #{max_prime_sum} = #{consists_prime_array.join(' + ')}"
  end
end
prime = PrimeAssignment.new
prime.maxPrimeSum(10000)
