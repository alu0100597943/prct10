class Fraccion
        include Comparable

        attr_reader :n, :d

        def initialize(num,den)
            @n,@d = num.to_i , den.to_i
        end
	def coerse(other)
		[other,self]
	end
        def to_s
            "#{@n} / #{@d}"
        end

        def gcd(u, v)
            u, v = u.abs, v.abs
            while v != 0
                u, v = v, u % v
            end
            u
        end

        def simply
            n = @n/gcd(@n,@d)
            d = @d/gcd(@n,@d)
            @n, @d = n, d
        end

        def +(other)
		if other.class != Fixnum
            		n = @n*other.d+@d*other.n
            		d = @d*other.d
            		Fraccion.new(n/gcd(n,d),d/gcd(n,d))
		elsif other.class == Fixnum
			n = @n+@d*other
			d = @d
		end
        end

        def -(other)
            n = @n*other.d-@d*other.n
            d = @d*other.d
            Fraccion.new(n/gcd(n,d),d/gcd(n,d))
        end

        def *(other)
            n = @n*other.n
            d = @d*other.d
            Fraccion.new(n/gcd(n,d),d/gcd(n,d))
        end

        def /(other)
            n = @n*other.d
            d = @d*other.n
            Fraccion.new(n/gcd(n,d),d/gcd(n,d))
        end

        def <=> (other)
            (@n.to_f / @d)<=>(other.n.to_f / other.d)
        end

        def imp_to_mix
            base = @n/@d
            num = @n % @d
            "#{base} + #{num}/#{@d}"
        end

        def recip
            Fraccion.new(@d,@n)
        end

        def num
            @n
        end

        def denom
            @d
        end

        def to_s
            "#{@n}/#{@d}"
        end

        def float
            "#{@n.to_f/@d}"
        end

        def fabs
            if @n < 0
                    @n=@n*(-1)
            end
            if @d < 0
                    @d = @d*(-1)
            end
            self.to_s
        end

        def op
           Fraccion.new(-@n,@d)        
        end

        def %(other)
            f1=self.n.to_f/self.d
            f2=other.n.to_f/other.d
            f1%f2
        end
end
f1=Fraccion.new(1,2)
r=1+f1
puts r
