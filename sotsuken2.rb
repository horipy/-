n_max = 200
v = 0 #価値
w = 0 #重さ

x_ge = Array.new(5)
x_v = Array.new(5)
x_w = Array.new(5)
#個体6
for m in 0..4
  ge = Array.new(6)
  #アイテムが6個あるため
    random = Random.new
    for i in 0..5
      ge_s = random.rand(2)
      ge[i] = ge_s
    end
    #遺伝子をランダムに入れる
    a = [45, 33]
    b = [12, 12]
    e = [9, 6]
    f = [6, 3]
    c = [3, 9]
    d = [24, 15]
    #アイテム[価値、重さ]
    all = [a,b,c,d,e,f]
    #配列にぶち込む
    for i in 0..5
      if ge[i]==1
        v += all[i][0]
        w += all[i][1]
      end
    end
  x_ge[m] = ge
  x_v[m] = v
  x_w[m] = w
  v = 0
  w = 0
  if x_w[m]>n_max
    x_v[m] = 0
    #重さを超えたら価値を０にするよ
  end
end

puts "遺伝子：#{x_ge}"
puts "価値：#{x_v}"
puts "重さ：#{x_w}"

#一番と二番目にいいのを求める
c = x_v.max
num_c = x_v.index(c) #配列の何番目を求める
puts "　優勝　遺伝子#{x_ge[num_c]} 価値#{c} 重さ#{x_w[num_c]}"
x_v.delete(c)
c_a = Array.new(4)
for j in 0..3
  x_v[j] ||= 0
  c_a[j] = c - x_v[j]
end
c_min = c_a.min
c_minnum = x_v.index(c-c_min)
if c_minnum >= num_c then
  c_minnum += 1
end
#差を出すことによって二番目を求める
puts "準優勝　遺伝子#{x_ge[c_minnum]} 価値#{c-c_min} 重さ#{x_w[c_minnum]}"

gets.to_i.times do |ii|
puts  "#{ii}世代　"

s = x_ge[num_c]
as =  s.map { |s|  s.to_s}
ss = as.map { |as| as.to_i}
sss = x_ge[c_minnum]
ssss = sss.map { |sss| sss.to_s}
sssss = ssss.map { |ssss| ssss.to_i}
x_ge[0] =  x_ge[num_c]
x_ge[1] =  x_ge[c_minnum]
one = x_ge[0][4]
oneone = x_ge[0][5]
two = x_ge[1][4]
twotwo = x_ge[1][5]
newone = x_ge[0]
newone.pop(2)
newtwo = x_ge[1]
newtwo.pop(2)
newone.push(two)
newone.push(twotwo)
newtwo.push(one)
newtwo.push(oneone) #後ろの二つをこうしゃ
x_ge[2] = newone
x_ge[3] = newtwo
newrand = Array.new(6)
  random = Random.new
  for i in 0..5
    ge_s = random.rand(2)
    newrand[i] = ge_s
  end #一番　二番　こうしゃ　こうしゃ２　ランダム
x_ge[4] = newrand
x_ge[0] = ss
x_ge[1] = sssss
p x_ge

x_v.push(0)
x_v[m] = 0
x_w[m] = 0
for k in 0..4
for q in 0..5
  if x_ge[k][q]==1
    v += all[q][0]
    w += all[q][1]
  end
end
x_v[k] = v
x_w[k] = w
v = 0
w = 0
if x_w[k]>n_max
x_v[k] = 0
#重さを超えたら価値を０にするよ
end
end
puts "遺伝子：#{x_ge}"
puts "価値：#{x_v}"
puts "重さ：#{x_w}"
c = x_v.max
num_c = x_v.index(c) #配列の何番目を求める
puts "　優勝　遺伝子#{x_ge[num_c]} 価値#{c} 重さ#{x_w[num_c]}"
x_v.delete(c)
c_a = Array.new(4)
for j in 0..3
 x_v[j] ||= 0
  c_a[j] = c - x_v[j]
end

c_min = c_a.min
c_minnum = x_v.index(c-c_min)
if c_minnum >= num_c then
  c_minnum += 1
end
#差を出すことによって二番目を求める
puts "準優勝　遺伝子#{x_ge[c_minnum]} 価値#{c-c_min} 重さ#{x_w[c_minnum]}"
end
