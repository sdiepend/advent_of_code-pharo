Class {
	#name : #Day04,
	#superclass : #Object,
	#category : #AdventOfCode2019
}

{ #category : #accessing }
Day04 >> partOne: range [
| ranges validCodes adjacent increase |
  ranges := (range splitOn: '-') collect: [ :val | val asInteger ].
  validCodes := Bag new.
  ((ranges at: 1) to: (ranges at: 2)) collect: [ :pin |
	  adjacent := false.
	  increase := true.
     (1 to: (pin asString size)-1) do: [ :i |
	    (((pin asString) at: i) = ((pin asString) at: (i+1))) ifTrue: [ adjacent := true. ].
       (((pin asString) at: i) asInteger <= ((pin asString) at: (i+1)) asInteger) ifFalse: [ increase := false ].
     ].
     (adjacent and: increase) ifTrue: [ validCodes add: pin ].
  ].

  ^ validCodes size.
	
]

{ #category : #'as yet unclassified' }
Day04 >> partTwo: range [
   | ranges validCodes adjacent increase counter previous current |
	ranges := (range splitOn: '-') collect: [ :val | val asInteger ].
validCodes := Bag new.
((ranges at: 1) to: (ranges at: 2)) collect: [ :pin |
	adjacent := false.
	increase := true.
	counter := 0.
   (1 to: (pin asString size)-1) do: [ :i |
	  previous := (pin asString) at: i.
	  current := (pin asString) at: (i+1).
	  (previous = current) ifTrue: [ counter := counter + 1 ]
	                       ifFalse: [ (counter = 1) ifTrue: [ adjacent := true ].
		                                counter := 0].
	  
     (previous asInteger <= current asInteger) ifFalse: [ increase := false ].
   ].
   ( counter = 1 ) ifTrue: [ adjacent := true ].
   (adjacent and: increase) ifTrue: [ validCodes add: pin ].
].

^ validCodes size
]

{ #category : #running }
Day04 >> run [
  | range |
	range := '372304-847060'. 
   ^ 'Part One: ', (self partOne: range) asString,' Part Two: ', (self partTwo: range) asString
]
