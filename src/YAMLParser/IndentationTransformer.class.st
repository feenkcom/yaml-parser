Class {
	#name : #IndentationTransformer,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'newline',
		'indent',
		'indents',
		'line',
		'transformIndents',
		'currentIndentation',
		'indentLevel',
		'indentToken',
		'dedentToken',
		'indentString',
		'end',
		'indentedLine',
		'nonIndentedLine'
	],
	#category : #'YAMLParser-PParser'
}

{ #category : #accessing }
IndentationTransformer class >> ignoredNames [
	^ super ignoredNames copyWithAll: #(indentString currentIndentation indentLevel indentToken dedentToken)
]

{ #category : #accessing }
IndentationTransformer class >> transform: aString [
	"Transform the inpput from a collection back into a string"

	^ self new transform: aString
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
	^ '#{DEDENT}#'
]

{ #category : #accessing }
IndentationTransformer >> defaultIndentString [
	"For YAML: two spaces"
	^ '  '
]

{ #category : #accessing }
IndentationTransformer >> defaultIndentToken [
	^ '#{INDENT}#'
]

{ #category : #grammar }
IndentationTransformer >> end [
	^ #endOfInput asPParser
		==> [ :node | 
			| output |
			output := OrderedCollection new.
			[ indentLevel < currentIndentation ]
				whileTrue: [ currentIndentation := currentIndentation - 1.
					output add: dedentToken ].
			output ]
]

{ #category : #grammar }
IndentationTransformer >> indent [
	^ self indentString asPParser
		==> [ :node | self indentLevel: self indentLevel + 1 ]
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
IndentationTransformer >> indentString [
	^ indentString
]

{ #category : #accessing }
IndentationTransformer >> indentString: anObject [
	indentString := anObject
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
IndentationTransformer >> indentedLine [
	^ (indents , #newline asPParser negate star)
		==> [ :node | node first , node second ]
]

{ #category : #grammar }
IndentationTransformer >> indents [
	^ (indent plus , self indentString asPParser not)
		==> [ :node | 
			| output |
			output := OrderedCollection new.
			self indentLevel > self currentIndentation
				ifTrue: [ output := indentToken repeat: self indentLevel - self currentIndentation ]
				ifFalse: [ output := dedentToken repeat: self currentIndentation - self indentLevel ].
			self currentIndentation: self indentLevel.
			output ]
]

{ #category : #accessing }
IndentationTransformer >> initialize [
	super initialize.
	self indentString: self defaultIndentString.
	self indentLevel: 0.
	self currentIndentation: 0.
	self indentToken: self defaultIndentToken.
	self dedentToken: self defaultDedentToken
]

{ #category : #grammar }
IndentationTransformer >> line [
	^ newline / indentedLine / nonIndentedLine
]

{ #category : #grammar }
IndentationTransformer >> newline [
	^ #newline asPParser
		==> [ :node | 
			self indentLevel: 0.
			node asOrderedCollection ]
]

{ #category : #grammar }
IndentationTransformer >> nonIndentedLine [
	^ (indentString asPParser not , #newline asPParser negate plus)
		==> [ :node | 
			| repeat |
			repeat := self currentIndentation.
			self currentIndentation: 0.
			{self dedentToken repeat: repeat} asOrderedCollection , node second ]
]

{ #category : #accessing }
IndentationTransformer >> start [
	^ transformIndents
]

{ #category : #transforming }
IndentationTransformer >> transform: aString [
	"Transform the inpput from a collection back into a string"

	^ '' join: (self parse: aString)
]

{ #category : #grammar }
IndentationTransformer >> transformIndents [
	^ line star end
		==> [ :node | 
			node
				add: {self dedentToken repeat: self currentIndentation} asOrderedCollection;
				flatten ]
]
