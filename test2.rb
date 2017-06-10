colors = ["red", "yellow", "blue"]
 
p colors[0]
p colors[0..1]
colors.push("black")
p colors

p colors.size()
p colors.sort!()

#配列
scores = {a: 100, b: 200}
p scores.size
p scores.keys

#計算
x = 50
y = "3"

p x + y.to_i

#配列　→　ハッシュ
p scores.to_h

p %q(He"llo)
p %w(red blue)

