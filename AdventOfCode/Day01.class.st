Class {
	#name : #Day01,
	#superclass : #Object,
	#category : #AdventOfCode
}

{ #category : #method }
Day01 >> partOne [

^ ((StandardFileStream oldFileNamed: 'input.txt') contents lines collect: #asInteger) sum
]
