Class {
	#name : #YAMLScanner,
	#superclass : #SmaCCScanner,
	#category : #'YAMLParser-SmaCC'
}

{ #category : #generated }
YAMLScanner >> emptySymbolTokenId [
	^ 15
]

{ #category : #generated }
YAMLScanner >> errorTokenId [
	^ 16
]

{ #category : #generated }
YAMLScanner >> scanForToken [
	self step.
	currentCharacter == Character lf ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter == Character cr
		ifTrue: [ self recordMatch: #(2).
			self step.
			currentCharacter == Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(2) ].
			^ self reportLastMatch ].
	currentCharacter == $: ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $\
		ifTrue: [ self step.
			currentCharacter == Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(4) ].
			currentCharacter == Character cr
				ifTrue: [ self recordMatch: #(4).
					self step.
					currentCharacter == Character lf
						ifTrue: [ ^ self recordAndReportMatch: #(4) ] ].
			^ self reportLastMatch ].
	(currentCharacter == Character tab or: [ currentCharacter == Character space ])
		ifTrue: [ [ self recordMatch: #(4).
			self step.
			currentCharacter == Character tab or: [ currentCharacter == Character space ] ]
				whileTrue.
			^ self reportLastMatch ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ [ self recordMatch: #(3).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
YAMLScanner >> tokenActions [
	^ #(nil nil nil #whitespace)
]
