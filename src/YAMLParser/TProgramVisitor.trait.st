Trait {
	#name : #TProgramVisitor,
	#traits : 'TSmaCCParseNodeVisitor',
	#classTraits : 'TSmaCCParseNodeVisitor classTrait',
	#category : #'YAMLParser-SmaCC'
}

{ #category : #generated }
TProgramVisitor >> visitProgram: aProgram [
	^ self visitSmaCCParseNode: aProgram
]
