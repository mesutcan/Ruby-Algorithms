#         Luhn algorithm
#         1. Starting with the next to last digit and continuing with every other
#            digit going back to the beginning of the card, double the digit
#         2. Sum all doubled and untouched digits in the number
#         3. If that total is a multiple of 10, the number is valid

card_num = ARGV.join

case
    when (card_num=~/^(34|37)\d{13}$/): print 'AMEX '
    # it is amex when it  begins with 34 vor 36 and the length is 15 numbers in total.
    when (card_num=~/^6011\d{12}$/): print 'Discover '
    # it is discover when it  begins with 6011 and the length is 16 numbers in total.
    when (card_num=~/^5[1-5]\d{14}$/): print 'MasterCard '
    # it is mastercard when it  begins with 51-55 and the length is 16 numbers in total.
    when (card_num=~/^4(\d{12}|\d{15})$/): print 'Visa '
    # it is visa when it  begins with 4 and the length is 13 or 16 numbers in total.
    else print 'Unknown '
end

i = 0

luhn_number = ''

card_num.reverse.each_byte {|char|
    if (i%2==1) then
        char = (char.chr.to_i * 2).to_s
        else
        char = char.chr
    end
    luhn_number = char + luhn_number
    i += 1
}

sum = 0

luhn_number.each_byte {|char| sum += char.chr.to_i }

if (sum%10==0) then
    print "Valid credit card\n"
    else
    print "Invalid credit card\n"
end