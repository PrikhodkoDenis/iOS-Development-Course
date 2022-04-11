import UIKit

/*
 Домашнее задание №3
 
 1. Создать тюпл с тремя параметрами(максимальное количество отжиманий, максимальное количество подтягиваний, максимальное количество приседаний). Тюпл должен быть параметрезированным, т.е. каждый параметр должен быть с именем.
 2. Распечатать этот тюпл через print(), посмотреть что внутри. Увидеть только три цифры.
 3. print()  но каждый параметр в своей строке. В строке должно быть название параметра и его значение. Для каких-то параметров вывести через индекс, а для других через параметр тюпла.
 4. Сделать такой же тюпл для другого человека.
 5. Посчитать разницу на сколько больше я могу сделать повторений чем другой человек. Результат сохранить тоже в тюпле и вывести через print.
 6. Используя промежуточные переменные поменять значения местами в тюплах.
 */

// Пункт 1

var mySportResults = (pushUps: 30, pullUps: 20, squats: 25)

//Пункт 2

print(mySportResults.pushUps)
print(mySportResults.pullUps)
print(mySportResults.squats)

//Пункт 3

print("I can push-up \(mySportResults.0) times")
print("I can pull-up \(mySportResults.pullUps) times")
print("I can squat \(mySportResults.2) times")

// Пункт 4

var myFriendResults = (pushUps: 27, подтягивания: 17, приседания: 23)

//Пункт 5

let difference = (mySportResults.0 - myFriendResults.0, mySportResults.1 - myFriendResults.1, mySportResults.2 - myFriendResults.2 )

print("I push-up more than my friend \(difference.0) times")
print("I pull-up more than my friend \(difference.1) times")
print("I squat more than my friend \(difference.2) times")

//Пункт 6

var first = myFriendResults.0
var second = myFriendResults.1
var third = myFriendResults.2

mySportResults = (first, second, third)
mySportResults
