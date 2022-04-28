module TestRefine
  refine String do
    def upcase
      self + " (refined)"
    end
  end
end

class ClassUsingRefine
  using TestRefine

  def refined_upcase(str)
    str.upcase
  end
end

class NormalClass
  def original_upcase(str)
    str.upcase
  end
end

obj = ClassUsingRefine.new
p obj.refined_upcase("abc") # => "abc (refined)"

obj = NormalClass.new
p obj.original_upcase("abc") # => "ABC"