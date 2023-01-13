Class {
	#name : #YAMLScanner,
	#superclass : #SmaCCScanner,
	#instVars : [
		'indentStack',
		'tokenStack'
	],
	#category : #'YAMLParser-SmaCC'
}

{ #category : #generated }
YAMLScanner >> DEDENTId [
	^ 16
]

{ #category : #generated }
YAMLScanner >> INDENTId [
	^ 17
]

{ #category : #generated }
YAMLScanner >> emptySymbolTokenId [
	^ 18
]

{ #category : #generated }
YAMLScanner >> errorTokenId [
	^ 19
]

{ #category : #private }
YAMLScanner >> indent [
	"Here we should generate the IDENT and DEDENT tokens.
	Code adapted from the PythonParser."

	| string spaces indents |
	self scope: #default.
	string := outputStream contents.
	spaces := 0.
	string
		do: [ :each | 
			each = Character newPage ifTrue: [ spaces := 0 ].
			each = Character space ifTrue: [ spaces := spaces + 1 ] ].
	spaces = 0 ifTrue: [ ^ super whitespace ].
	spaces even ifTrue: [ indents := spaces / 2 ] ifFalse: [ ^ self scannerError ].
	indents > self indentStack last
		ifTrue: [ self indentStack add: indents.
			matchActions := Array with: self INDENTId.
			^ self createTokenFor: '' ].
	[ indents < self indentStack last ]
		whileTrue: [ matchActions := Array with: self DEDENTId.
			self tokenStack add: (self createTokenFor: '').
			self indentStack removeLast ].
	indents = self indentStack last ifFalse: [ ^ self scannerError ].
	^ self next
]

{ #category : #acccessing }
YAMLScanner >> indentStack [
	"Stack to track the current indentation levels."

	^ indentStack ifNil: [ indentStack := OrderedCollection with: 0 ]
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

{ #category : #acccessing }
YAMLScanner >> tokenStack [
	"Stack of generated INDENT and DEDENT tokens to emit before reading more input"

	^ tokenStack ifNil: [ tokenStack := OrderedCollection new ]
]
