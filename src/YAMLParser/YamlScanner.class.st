Class {
	#name : #YamlScanner,
	#superclass : #SmaCCScanner,
	#category : #'YAMLParser-SmaCC'
}

{ #category : #generated }
YamlScanner >> emptySymbolTokenId [
	^ 8
]

{ #category : #generated }
YamlScanner >> errorTokenId [
	^ 9
]

{ #category : #generated }
YamlScanner >> scanForToken [
	self step.
	currentCharacter == $: ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ [ self recordMatch: #(2 3).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]
