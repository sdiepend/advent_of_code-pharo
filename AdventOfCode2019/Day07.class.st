Class {
	#name : #Day07,
	#superclass : #Object,
	#category : #AdventOfCode2019
}

{ #category : #helpers }
Day07 >> inputString [
^'3,8,1001,8,10,8,105,1,0,0,21,42,63,76,101,114,195,276,357,438,99999,3,9,101,2,9,9,102,5,9,9,1001,9,3,9,1002,9,5,9,4,9,99,3,9,101,4,9,9,102,5,9,9,1001,9,5,9,102,2,9,9,4,9,99,3,9,1001,9,3,9,1002,9,5,9,4,9,99,3,9,1002,9,2,9,101,5,9,9,102,3,9,9,101,2,9,9,1002,9,3,9,4,9,99,3,9,101,3,9,9,102,2,9,9,4,9,99,3,9,1001,9,2,9,4,9,3,9,102,2,9,9,4,9,3,9,101,2,9,9,4,9,3,9,102,2,9,9,4,9,3,9,101,1,9,9,4,9,3,9,1001,9,2,9,4,9,3,9,1001,9,1,9,4,9,3,9,1001,9,2,9,4,9,3,9,1001,9,2,9,4,9,3,9,1001,9,1,9,4,9,99,3,9,102,2,9,9,4,9,3,9,1001,9,2,9,4,9,3,9,102,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,1001,9,1,9,4,9,3,9,102,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,102,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,102,2,9,9,4,9,99,3,9,102,2,9,9,4,9,3,9,102,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,1001,9,2,9,4,9,3,9,1002,9,2,9,4,9,3,9,1001,9,1,9,4,9,3,9,1002,9,2,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,1001,9,2,9,4,9,99,3,9,1001,9,1,9,4,9,3,9,101,2,9,9,4,9,3,9,102,2,9,9,4,9,3,9,1001,9,2,9,4,9,3,9,1001,9,1,9,4,9,3,9,102,2,9,9,4,9,3,9,1001,9,2,9,4,9,3,9,1001,9,2,9,4,9,3,9,102,2,9,9,4,9,3,9,1001,9,2,9,4,9,99,3,9,102,2,9,9,4,9,3,9,101,1,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,1002,9,2,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,1001,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,2,9,9,4,9,99'
]

{ #category : #puzzles }
Day07 >> partOne [
| day05 program phaseSettings highestSignal output |
day05 := Day05 new.
program := (self inputString splitOn: ',') collect: [ :each | each asInteger ].
highestSignal := 0.
phaseSettings := OrderedCollection.

(0 to: 4) permutationsDo: [ :p |
	output := 0.
	p do: [ :phase | 
		output := day05 partTwoWithCustomInput: program inputs: (OrderedCollection with: phase with: output) ].
	(output > highestSignal ) ifTrue: [ highestSignal := output.
		                                 phaseSettings := p ]
].

^highestSignal
]

{ #category : #puzzles }
Day07 >> partTwo [
| day05 program phaseSettings highestSignal output |
day05 := Day05 new.
program := (self inputString splitOn: ',') collect: [ :each | each asInteger ].
highestSignal := 0.
phaseSettings := OrderedCollection.

(0 to: 4) permutationsDo: [ :p |
	output := 0.
	p do: [ :phase | 
		output := day05 partTwoWithCustomInput: program inputs: (OrderedCollection with: phase with: output) ].
	(output > highestSignal ) ifTrue: [ highestSignal := output.
		                                 phaseSettings := p ]
].

^highestSignal
]

{ #category : #tests }
Day07 >> testInputString [
	^'3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0'
]
