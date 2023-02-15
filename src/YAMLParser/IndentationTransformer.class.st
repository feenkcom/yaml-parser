Class {
	#name : #IndentationTransformer,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'newline',
		'indent',
		'indents',
		'line',
		'linenl',
		'transformIndents',
		'currentIndentation',
		'indentLevel',
		'indentToken',
		'dedentToken'
	],
	#category : #'YAMLParser-PParser'
}

{ #category : #accessing }
IndentationTransformer class >> ignoredNames [
	^ super ignoredNames copyWithAll: #(currentIndentation indentLevel indentToken dedentToken)
]

{ #category : #accessing }
IndentationTransformer >> currentIndentation [
	^ currentIndentation
]

{ #category : #accessing }
IndentationTransformer >> currentIndentation: anObject [
	currentIndentation := anObject
]

{ #category : #accessing }
IndentationTransformer >> dedentToken [
	^ dedentToken
]

{ #category : #accessing }
IndentationTransformer >> dedentToken: anObject [
	dedentToken := anObject
]

{ #category : #accessing }
IndentationTransformer >> defaultDedentToken [
	^ '<<DEDENT>>'
]

{ #category : #accessing }
IndentationTransformer >> defaultIndentToken [
	^ '<<INDENT>>'
]

{ #category : #grammar }
IndentationTransformer >> indent [
	^ '  ' asPParser ==> [ :node | self indentLevel: self indentLevel + 1 ]
]

{ #category : #accessing }
IndentationTransformer >> indentLevel [
	^ indentLevel
]

{ #category : #accessing }
IndentationTransformer >> indentLevel: anObject [
	indentLevel := anObject
]

{ #category : #accessing }
IndentationTransformer >> indentToken [
	^ indentToken
]

{ #category : #accessing }
IndentationTransformer >> indentToken: anObject [
	indentToken := anObject
]

{ #category : #grammar }
IndentationTransformer >> indents [
	^ (indent star , indent not)
		==> [ :node | 
			| output |
			output := OrderedCollection new.
			[ self indentLevel > self currentIndentation ]
				whileTrue: [ self currentIndentation: self currentIndentation + 1.
					output add: self indentToken ].
			[ self indentLevel < self currentIndentation ]
				whileTrue: [ self currentIndentation: self currentIndentation - 1.
					output add: self dedentToken ].
			output ]
]

{ #category : #accessing }
IndentationTransformer >> initialize [
	super initialize.
	self indentLevel: 0.
	self currentIndentation: 0.
	self indentToken: self defaultIndentToken.
	self dedentToken: self defaultDedentToken
]

{ #category : #grammar }
IndentationTransformer >> line [
	^ (indents , #newline asPParser negate plus)
		==> [ :node | node first , node second ]
]

{ #category : #grammar }
IndentationTransformer >> linenl [
	^ (line , newline) ==> [ :node | node first , node second ]
]

{ #category : #grammar }
IndentationTransformer >> newline [
	^ #newline asPParser
		==> [ :node | 
			self indentLevel: 0.
			node asOrderedCollection ]
]

{ #category : #accessing }
IndentationTransformer >> start [
	^ transformIndents
]

{ #category : #grammar }
IndentationTransformer >> transformIndents [
	^ (linenl / line) star ==> [ :node | node flatten ]
]
