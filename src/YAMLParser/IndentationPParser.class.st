"
I am a demo of how to turn the Indentation parser script into a class.
The parser will recognize YAML-style 2-space indentation, to produce a nested OrderedDictionary structure of the lines of the input.
"
Class {
	#name : #IndentationPParser,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'indent',
		'line',
		'newline',
		'linenl',
		'yaml',
		'yamlEnd',
		'root',
		'currentIndentation',
		'dictionaryStack',
		'indentLevel'
	],
	#category : #'YAMLParser-PParser'
}

{ #category : #accessing }
IndentationPParser class >> ignoredNames [
	^ super ignoredNames copyWithAll: #(root currentIndentation dictionaryStack indentLevel)
]

{ #category : #tokens }
IndentationPParser >> indent [
	^ '  ' asPParser ==> [ :node | indentLevel := indentLevel + 1 ]
]

{ #category : #initialization }
IndentationPParser >> initialize [
	super initialize.
	indentLevel := 0.
	root := OrderedDictionary new.
	dictionaryStack := {root} asOrderedCollection.
	currentIndentation := 0
]

{ #category : #grammar }
IndentationPParser >> line [
	^ (indent star , indent not , #newline asPParser negate plus flatten)
		==> [ :node | 
			indentLevel - currentIndentation > 1
				ifTrue: [ self error: 'Too much indentation!' ].
			indentLevel = (currentIndentation + 1)
				ifTrue: [ currentIndentation := indentLevel.
					self
						assert: [ dictionaryStack last notEmpty ]
						description: 'Nothing to indent from.'.
					dictionaryStack
						addLast: (dictionaryStack last at: dictionaryStack last keys last) ].
			[ indentLevel < currentIndentation ]
				whileTrue: [ currentIndentation := currentIndentation - 1.
					dictionaryStack removeLast ].
			dictionaryStack last value at: node third put: OrderedDictionary new.
			node third ]
]

{ #category : #grammar }
IndentationPParser >> linenl [
	^ (line , newline) ==> #first
]

{ #category : #tokens }
IndentationPParser >> newline [
	^ #newline asPParser ==> [ :node | indentLevel := 0 ]
]

{ #category : #accessing }
IndentationPParser >> start [
	^ yamlEnd 
]

{ #category : #grammar }
IndentationPParser >> yaml [
	^ (linenl / line) star ==> [ :node | root ]
]

{ #category : #accessing }
IndentationPParser >> yamlEnd [
	^ yaml end
]
