
file = open("C:/Users/heman_6e6o1cr/Downloads/sample-2mb-text-file.txt", "r+")


lines = file.readlines()

dictionary = {}


for line in lines:

    line_word = line.lower().replace(',', '').replace('.', '').split(" ")

    for w in line_word:

        if len(w)>1 and w[-1] == '.':
            w = w[0:len(w) - 1]

        if w in dictionary:
            dictionary[w] += 1
        else:
            dictionary.update({w: 1})


print(dictionary[max(dictionary,key=dictionary.get)])

x=max(dictionary,key=dictionary.get)
y="loopr"

with open(r"C:/Users/heman_6e6o1cr/Downloads/sample-2mb-text-file.txt", 'r') as file:
    data = file.read()
    data = data.replace(x, y)
with open(r"C:/Users/heman_6e6o1cr/Downloads/sample-2mb-text-file.txt", 'w') as file:

    file.write(data)
file.close()
