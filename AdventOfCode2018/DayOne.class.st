Class {
	#name : #DayOne,
	#superclass : #Object,
	#category : #AdventOfCode2018
}

{ #category : #'as yet unclassified' }
DayOne >> partOne [
	^ ((StandardFileStream oldFileNamed: 'input.txt') contents lines collect: #asInteger) sum
]
