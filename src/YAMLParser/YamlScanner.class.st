Class {
	#name : #YamlScanner,
	#superclass : #SmaCCScanner,
	#instVars : [
		'indentStack',
		'tokenStack'
	],
	#category : #'YAMLParser-SmaCC'
}

{ #category : #generated }
YamlScanner >> DEDENTId [
	^ 10
]

{ #category : #generated }
YamlScanner >> INDENTId [
	^ 11
]

{ #category : #generated }
YamlScanner >> emptySymbolTokenId [
	^ 12
]

{ #category : #generated }
YamlScanner >> errorTokenId [
	^ 13
]

{ #category : #accessing }
YamlScanner >> indent [
	"Here we should generate the IDENT and DEDENT tokens"

	| string count |
	self scope: #default.
	string := outputStream contents.
	count := 0.
	string
		do: [ :each | 
			each = Character newPage
				ifTrue: [ count := 0 ].
			each = Character space
				ifTrue: [ count := count + 1 ].
			each = Character tab
				ifTrue: [ count := (count // 8 + 1) * 8 ] ].
	count = 0
		ifTrue: [ ^ super whitespace ].
	count > self indentStack last
		ifTrue: [ 
			self indentStack add: count.
			matchActions := Array with: self INDENTId.
			^ self createTokenFor: '' ].
	[ count < self indentStack last ]
		whileTrue: [ 
			matchActions := Array with: self DEDENTId.
			self tokenStack add: (self createTokenFor: '').
			self indentStack removeLast ].
	count = self indentStack last
		ifFalse: [ ^ self scannerError ].	"A bit crude, but shows an indentation error."
	^ self next
]

{ #category : #accessing }
YamlScanner >> indentStack [
	^ indentStack ifNil: [ indentStack := OrderedCollection with: 0 ]
]

{ #category : #accessing }
YamlScanner >> next [
	self tokenStack isEmpty
		ifFalse: [ ^ self tokenStack removeFirst ].
	^ super next
]

{ #category : #generated }
YamlScanner >> scanForToken [
	self recordMatch: #(3).
	self step.
	currentCharacter == $: ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	(currentCharacter isSeparator or: [ currentCharacter == Character pageUp ])
		ifTrue: [ [ self recordMatch: #(3).
			self step.
			currentCharacter isSeparator or: [ currentCharacter == Character pageUp ] ]
				whileTrue.
			^ self reportLastMatch ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ [ self recordMatch: #(2).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
YamlScanner >> tokenActions [
	^ #(nil nil #whitespace)
]

{ #category : #accessing }
YamlScanner >> tokenStack [
	^ tokenStack ifNil: [ tokenStack := OrderedCollection new ]
]
