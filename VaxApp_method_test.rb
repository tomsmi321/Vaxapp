
# Test document for VaxApp.rb
# This is a test of the string_of_nums? method in the Validator class of VaxApp.rb
# The methods intended purpose is to take in any type of input then test if the input given is of type Integer and return
# true or false accordingly.


# Method being tested:
class Validator
    class << self
        def string_of_nums?(input)
            !!Integer(input) rescue false
        end
    end
end





# test number: 1
# type: positive test
# test method name: test_pos_int()
# inputs: 10 (type: int)
# expected result: true (type: boolean)
def test_pos_int(pos_int, exp_result)
    actual_result = Validator.string_of_nums?(pos_int)
    if(actual_result == exp_result)
        puts("PASS")
    else
        puts("FAIL")
    end
    return actual_result
end
# run test:
puts("test 1:")
puts(test_pos_int(10, true))
# actual result: PASS, true
puts



# test number: 2
# type: positive test
# test method name: test_neg_int()
# inputs: -10 (type: int)
# expected result: true (type: boolean)
def test_neg_int(neg_int, exp_result)
    actual_result = Validator.string_of_nums?(neg_int)
    if(actual_result == exp_result)
        puts("PASS")
    else
        puts("FAIL")
    end
    return actual_result
end
# run test:
puts("test 2:")
puts(test_neg_int(-10, true))
# actual result: PASS, true
puts



# test number: 3
# type: positive test
# test method name: test_zero_int()
# inputs: 0 (type: int)
# expected result: true (type: boolean)
def test_zero_int(zero_int, exp_result)
    actual_result = Validator.string_of_nums?(zero_int)
    if(actual_result == exp_result)
        puts("PASS")
    else
        puts("FAIL")
    end
    return actual_result
end
# run test:
puts("test 3:")
puts(test_zero_int(0, true))
# actual result: PASS, true
puts


# test number: 4
# type: negative test
# test method name: test_pos_float()
# inputs: 10.5 (type: float)
# expected result: false (type: boolean)
def test_pos_float(pos_float, exp_result)
    actual_result = Validator.string_of_nums?(pos_float)
    if(actual_result == exp_result)
        puts("PASS")
    else
        puts("FAIL")
    end
    return actual_result
end
# run test:
puts("test 4:")
puts(test_pos_float(10.5, false))
# actual result: FAIL, true
puts



# test number: 5
# type: negative test
# test method name: test_empty_str()
# inputs: "" (type: string)
# expected result: false (type: boolean)
def test_empty_str(empty_str, exp_result)
    actual_result = Validator.string_of_nums?(empty_str)
    if(actual_result == exp_result)
        puts("PASS")
    else
        puts("FAIL")
    end
    return actual_result
end
# run test:
puts("test 5:")
puts(test_empty_str("", false))
# actual result: PASS, false
puts




# test number: 6
# type: negative test
# test method name: test_nil()
# inputs: nil (type: nil)
# expected result: false (type: boolean)
def test_nil(nil_nil, exp_result)
    actual_result = Validator.string_of_nums?(nil_nil)
    if(actual_result == exp_result)
        puts("PASS")
    else
        puts("FAIL")
    end
    return actual_result
end
# run test:
puts("test 6:")
puts(test_empty_str(nil, false))
# actual result: PASS, false
puts
