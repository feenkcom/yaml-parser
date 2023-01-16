Trait {
	#name : #TYAMLRootNodeVisitor,
	#traits : 'TSmaCCParseNodeVisitor',
	#classTraits : 'TSmaCCParseNodeVisitor classTrait',
	#category : #'YAMLParser-SmaCC'
}

{ #category : #generated }
TYAMLRootNodeVisitor >> visitFile: aFile [
	^ self visitRoot: aFile
]

{ #category : #generated }
TYAMLRootNodeVisitor >> visitIdent: anIdent [
	^ self visitRoot: anIdent
]

{ #category : #generated }
TYAMLRootNodeVisitor >> visitListItem: aListItem [
	^ self visitRoot: aListItem
]

{ #category : #generated }
TYAMLRootNodeVisitor >> visitMapping: aMapping [
	^ self visitRoot: aMapping
]

{ #category : #generated }
TYAMLRootNodeVisitor >> visitRoot: aRoot [
	^ self visitSmaCCParseNode: aRoot
]

{ #category : #generated }
TYAMLRootNodeVisitor >> visitlistItems: alistItems [
	^ self visitRoot: alistItems
]

{ #category : #generated }
TYAMLRootNodeVisitor >> visitmappings: amappings [
	^ self visitRoot: amappings
]
