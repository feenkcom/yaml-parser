Class {
	#name : #IndentationTransformer,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'newline',
		'indent',
		'indents',
		'line',
		'linenl',
		'transformIndents'
	],
	#category : #'YAMLParser-PParser'
}

{ #category : #grammar }
IndentationTransformer >> indent [
	^ '  ' asPParser
]

{ #category : #grammar }
IndentationTransformer >> indents [
	^ indent star , indent not
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
]

{ #category : #accessing }
IndentationTransformer >> start [
	^ transformIndents
]

{ #category : #grammar }
IndentationTransformer >> transformIndents [
	^ (linenl / line) star ==> [ :node | node flatten ]
]
