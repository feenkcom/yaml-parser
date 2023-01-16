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
	^ 23
]

{ #category : #generated }
YAMLScanner >> INDENTId [
	^ 24
]

{ #category : #private }
YAMLScanner >> NEWLINE [
	"See PythonScanner>>#NEWLINE"

	matchActions := Array with: self NEWLINEId.
	self scope: #lineBegin.
	^ self createTokenFor: ''
]

{ #category : #generated }
YAMLScanner >> NEWLINEId [
	^ 3
]

{ #category : #generated }
YAMLScanner >> emptySymbolTokenId [
	^ 25
]

{ #category : #generated }
YAMLScanner >> errorTokenId [
	^ 26
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

{ #category : #initialization }
YAMLScanner >> initialize [
	super initialize.
	scope := #lineBegin
]

{ #category : #private }
YAMLScanner >> noindent [
	"We should revert to the beginning of the scan."

	self scope: #default.
	stream position: start.
	^ self next
]

{ #category : #generated }
YAMLScanner >> scanForToken [
	scope == #lineBegin ifTrue: [ ^ self scanForTokenX2 ].
	^ self scanForTokenX6
]

{ #category : #generated }
YAMLScanner >> scanForTokenX1 [
	[ self recordMatch: #(4).
	self step.
	(currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
		whileTrue
]

{ #category : #generated }
YAMLScanner >> scanForTokenX2 [
	self step.
	(currentCharacter == Character newPage
		or: [ currentCharacter == Character space ])
		ifTrue: [ [ self recordMatch: #(6).
			self step.
			currentCharacter == Character newPage
				or: [ currentCharacter == Character space ] ] whileTrue.
			^ self reportLastMatch ].
	^ self recordAndReportMatch: #(7)
]

{ #category : #generated }
YAMLScanner >> scanForTokenX3 [
	[ self recordMatch: #(5).
	self step.
	currentCharacter == Character tab or: [ currentCharacter == Character space ] ]
		whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
YAMLScanner >> scanForTokenX4 [
	self step.
	currentCharacter == Character lf ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter == Character cr
		ifTrue: [ self recordMatch: #(5).
			self step.
			currentCharacter == Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(5) ] ].
	^ self reportLastMatch
]

{ #category : #generated }
YAMLScanner >> scanForTokenX5 [
	self recordMatch: #(3).
	self step.
	currentCharacter == Character lf ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	^ self reportLastMatch
]

{ #category : #generated }
YAMLScanner >> scanForTokenX6 [
	scope == #default
		ifTrue: [ self step.
			currentCharacter == Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(3) ].
			currentCharacter == Character cr ifTrue: [ ^ self scanForTokenX5 ].
			currentCharacter == $- ifTrue: [ ^ self recordAndReportMatch: #(1) ].
			currentCharacter == $: ifTrue: [ ^ self recordAndReportMatch: #(2) ].
			currentCharacter == $\ ifTrue: [ ^ self scanForTokenX4 ].
			(currentCharacter == Character tab
				or: [ currentCharacter == Character space ])
				ifTrue: [ ^ self scanForTokenX3 ].
			((currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
				ifTrue: [ self scanForTokenX1 ] ].
	^ self reportLastMatch
]

{ #category : #private }
YAMLScanner >> scannerError [
	"At end, generate any missing DEDENT tokens."
	(stream atEnd and: [ start == stream position ])
		ifTrue: [ [ self indentStack last > 0 ]
				whileTrue: [ matchActions := Array with: self DEDENTId.
					self tokenStack add: (self createTokenFor: '').
					self indentStack removeLast ].
			self tokenStack notEmpty
				ifTrue: [ returnMatchBlock value: self tokenStack removeFirst ] ].
	super scannerError
]

{ #category : #generated }
YAMLScanner >> tokenActions [
	^ #(nil nil #NEWLINE nil #whitespace #indent #noindent)
]

{ #category : #acccessing }
YAMLScanner >> tokenStack [
	"Stack of generated INDENT and DEDENT tokens to emit before reading more input"

	^ tokenStack ifNil: [ tokenStack := OrderedCollection new ]
]
