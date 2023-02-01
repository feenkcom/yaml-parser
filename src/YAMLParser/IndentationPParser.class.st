Class {
	#name : #IndentationPParser,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'indent',
		'line',
		'newline',
		'linenl',
		'yaml',
		'yamlEnd'
	],
	#category : #'YAMLParser-PParser'
}

{ #category : #indentation }
IndentationPParser >> checkIndentationFor: node [
	self indentLevel - self currentIndentation > 1
		ifTrue: [ self error: 'Too much indentation!' ].
	self indentLevel = (self currentIndentation + 1)
		ifTrue: [ self currentIndentation: self indentLevel.
			self
				assert: [ self dictionaryStack last notEmpty ]
				description: 'Nothing to indent from.'.
			self dictionaryStack
				addLast: (self dictionaryStack last at: self dictionaryStack last keys last) ].
	[ self indentLevel < self currentIndentation ]
		whileTrue: [ self currentIndentation: self currentIndentation - 1.
			self dictionaryStack removeLast ].
	self dictionaryStack last value at: node third put: OrderedDictionary new
]

{ #category : #accessing }
IndentationPParser >> currentIndentation [
	^ self propertyAt: #currentIndentation
]

{ #category : #accessing }
IndentationPParser >> currentIndentation: aNumber [
	self propertyAt: #currentIndentation put: aNumber
]

{ #category : #accessing }
IndentationPParser >> dictionaryStack [
	^ self propertyAt: #dictionaryStack
]

{ #category : #accessing }
IndentationPParser >> dictionaryStack: anObject [
	self propertyAt: #dictionaryStack put: anObject
]

{ #category : #tokens }
IndentationPParser >> indent [
	^ '  ' asPParser ==> [ :node | self indentLevel: self indentLevel + 1 ]
]

{ #category : #accessing }
IndentationPParser >> indentLevel [
	^ self propertyAt: #indentLevel
]

{ #category : #accessing }
IndentationPParser >> indentLevel: aNumber [
	self propertyAt: #indentLevel put: aNumber
]

{ #category : #initialization }
IndentationPParser >> initialize [
	super initialize.
	self indentLevel: 0.
	self root: OrderedDictionary new.
	self dictionaryStack: {self root} asOrderedCollection.
	self currentIndentation: 0
]

{ #category : #grammar }
IndentationPParser >> line [
	^ (indent star , indent not , #newline asPParser negate plus flatten)
		==> [ :node | 
			self checkIndentationFor: node.
			node third ]
]

{ #category : #grammar }
IndentationPParser >> linenl [
	^ (line , newline) ==> #first
]

{ #category : #tokens }
IndentationPParser >> newline [
	^ #newline asPParser ==> [ :node | self indentLevel: 0 ]
]

{ #category : #accessing }
IndentationPParser >> root [	^ self propertyAt: #root
]

{ #category : #accessing }
IndentationPParser >> root: anObject [
	self propertyAt: #root put: anObject
]

{ #category : #accessing }
IndentationPParser >> start [
	^ yamlEnd 
]

{ #category : #grammar }
IndentationPParser >> yaml [
	^ (linenl / line) star ==> [ :node | self root ]
]

{ #category : #accessing }
IndentationPParser >> yamlEnd [
	^ yaml end
]
