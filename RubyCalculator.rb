#       -*- coding: utf-8 -*-
#
#      Ruby Calculator v1.1.0
#          by gdi2290
#
#    MRI Ruby Version: 2.0.0p195
#

# method_missing approach
class Calculator
  def initialize
    @cal={
      add:      ->(a,b) { a + b },
      subtract: ->(a,b) { a - b },
      divide:   ->(a,b) { a / b },
      multiply: ->(a,b) { a * b },
      power:    ->(a,b) { a ** b }
    }
  end
  def method_missing(expression, a, b)
    @cal[expression].call(a,b)
  end
end

# define_method approach
class Calculator
  def initialize
    cal :add, :+
    cal :subtract, :-
    cal :divide, :/
    cal :multiply, :*
    cal :power, :**
  end

  def cal(name, sym)
    Calculator.class_eval do
      define_method name, ->(a, b) { a.send(sym, b) }
    end
  end
end

# basic approach
class Calculator
  def add(a, b)
    a + b
  end

  def subtract(a, b)
    a - b
  end

  def divide(a, b)
    a / b
  end

  def muliply(a, b)
    a * b
  end

  def power(a, b)
    a ** b
  end
end
