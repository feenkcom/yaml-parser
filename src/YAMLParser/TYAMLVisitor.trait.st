Trait {
	#name : #TYAMLVisitor,
	#traits : 'TSmaCCParseNodeVisitor',
	#classTraits : 'TSmaCCParseNodeVisitor classTrait',
	#category : #YAMLParser
}

{ #category : #generated }
TYAMLVisitor >> visitYAML: aYAML [
	^ self visitSmaCCParseNode: aYAML
]
