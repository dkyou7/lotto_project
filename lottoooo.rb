require 'open-uri'
require 'json'
page = open("http://www.nlotto.co.kr/common.do?method=getLottoNumber")

lotto_read = page.read

lotto_json = JSON.parse(lotto_read)


winning_nums = Array.new


winning_nums.push(lotto_json["drwtNo1"])

winning_nums.push(lotto_json["drwtNo2"])

winning_nums.push(lotto_json["drwtNo3"])

winning_nums.push(lotto_json["drwtNo4"])

winning_nums.push(lotto_json["drwtNo5"])

winning_nums.push(lotto_json["drwtNo6"])


winning_nums.push(lotto_json["bnusNo"])


random_numbers = Array.new 

random_numbers_final = Array.new 

for i in 1..45
    random_nums.push(i)

end


yes_or_no = "yes" 



while yes_or_no =="yes"

random_nums.shuffle!

random_nums_final=random_nums[0..5] #6개를 저장


count = 0 

bNusCnt =0 #보너스 점수



random_nums_final.sort!
winning_nums.sort!



print "\n당신이 뽑은 번호입니다. : "

random_nums_final.each do |x| print "#{x} ,"
end

print "\n당첨 번호는?? :"

winning_nums.each do |x| print "#{x} ,"
end



for i in 0..5
    for j in 0..5
        if winning_nums[i]==random_nums_final[j]
            count+=1
        end
    end
end



for i in 0..5
    if random_nums_final[i]==winning_nums[6]
        bNusCnt+=1
    end
end


print "당첨번호와 일치하는 번호 갯수: " + count

print "보너스번번호와 일치하는 번호 갯수: "+ bNusCnt

if count==6
    puts "축하합니다. 1등입니다!!"

elsif count==5 && bNusCnt==1 

    puts "아쉽습니다. 2등입니다."

elsif count==5

    puts "3등입니다."

elsif count==4

    puts "4등입니다."

elsif count==3

    puts "5등입니다."

elsif count<=2

    puts "6등입니다."
    

end

    puts "다시하시겠어요 ? 그럼 yes 입력"

    yes_or_no=gets.chomp


end
