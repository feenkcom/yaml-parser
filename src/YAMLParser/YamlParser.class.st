"
A prototype of a YAML parser, based on the ANTLR YAML grammar.
Work in progress ...
"
Class {
	#name : #YAMLParser,
	#superclass : #SmaCCParser,
	#category : #'YAMLParser-SmaCC'
}

{ #category : #'generated-accessing' }
YAMLParser class >> cacheId [
	^'2023-01-16T17:00:29.567159+01:00'
]

{ #category : #generated }
YAMLParser class >> definitionComment [
"%root Root;
%prefix YAML;
%suffix Node;
%id <INDENT> <DEDENT>  <NEWLINE>;
<NEWLINE>
	: <cr>
	;
<ident_temp>
	: \w+
	;
<cr> : \r | \n | \r\n ;
<whitespace> : [ \t]+ | \\<cr>;
lineBegin <indent>
# The indent method will generate the right number of INDENT or DEDENT tokens
	: [ \f]+
	;
lineBegin <noindent>  : [^ \f] ;
file
	: <NEWLINE>* document 'document' <NEWLINE>* {{}}
	;
document
	: list | mappingList
	;
list
	: (<NEWLINE>* listItem 'listItem' <NEWLINE>?)+ {{listItems}}
	;
listItem
# TODO -- add anchors etc etc
	: ""-"" 
		( value 'value' 
		| <NEWLINE>+ <INDENT> list 'list' <DEDENT> 
		) {{}}
	;
mappingList
	: (<NEWLINE>* mapping 'mapping' <NEWLINE>?)+ {{mappings}}
	;
mapping
	: key 'key' "":"" <NEWLINE>+ <INDENT> mappingList 'mappingList' <DEDENT> {{}}
	| key 'key' "":"" value 'value'? {{}}
	;
value
	: <ident_temp> 'ident' {{Ident}}
	;
key
	: <ident_temp> 'ident' {{Ident}}
	;"
]

{ #category : #generated }
YAMLParser class >> reduceTable [
^#(
	#(10 0 #nil 333825 false) 
	#(10 2 #liftFirstValue: 333826 false) 
	#(11 1 #liftFirstValue: 385025 false) 
	#(14 1 #reduceActionFor__NEWLINE___listItem__listItem___NEWLINE____1: 428033 false) 
	#(12 1 #reduceActionForlist1: 419841 false) 
	#(11 1 #liftFirstValue: 385026 false) 
	#(19 1 #reduceActionFor__NEWLINE___listItem__listItem___NEWLINE____1: 633857 false) 
	#(17 1 #reduceActionFormappingList1: 618497 false) 
	#(22 1 #reduceActionForkey1: 866305 false) 
	#(13 2 #liftSecondValue: 428033 false) 
	#(18 2 #liftSecondValue: 633857 false) 
	#(9 3 #reduceActionForfile1: 325633 false) 
	#(14 2 #reduceActionFor__NEWLINE___listItem__listItem___NEWLINE____2: 428034 false) 
	#(19 2 #reduceActionFor__NEWLINE___listItem__listItem___NEWLINE____2: 633858 false) 
	#(16 1 #liftFirstValue: 563201 false) 
	#(21 1 #reduceActionForkey1: 822273 false) 
	#(15 2 #reduceActionForlistItem1: 491521 false) 
	#(13 3 #liftSecondValue: 428034 false) 
	#(18 3 #liftSecondValue: 633858 false) 
	#(20 2 #reduceActionFormapping2: 694274 false) 
	#(16 2 #liftFirstValue: 563202 false) 
	#(20 3 #reduceActionFormapping3: 694275 false) 
	#(15 5 #reduceActionForlistItem2: 491522 false) 
	#(20 6 #reduceActionFormapping1: 694273 false)
	).
]

{ #category : #generated }
YAMLParser class >> scannerClass [
	^YAMLScanner
]

{ #category : #generated }
YAMLParser class >> startingStateForfile [
	^ 1
]

{ #category : #generated }
YAMLParser class >> symbolNames [
	^ #('"-"' '":"' '<NEWLINE>' '<ident_temp>' '<whitespace>' '<indent>' '<noindent>' 'B e g i n' 'file' '<NEWLINE>*' 'document' 'list' '(<NEWLINE>* listItem ''listItem'' <NEWLINE>?)' '(<NEWLINE>* listItem ''listItem'' <NEWLINE>?)+' 'listItem' '<NEWLINE>+' 'mappingList' '(<NEWLINE>* mapping ''mapping'' <NEWLINE>?)' '(<NEWLINE>* mapping ''mapping'' <NEWLINE>?)+' 'mapping' 'value' 'key' '<DEDENT>' '<INDENT>' 'E O F' 'error')
]

{ #category : #generated }
YAMLParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #YAMLFileNode #YAMLFileNode nil #YAMLRootNode #YAMLlistItemsNode #YAMLListItemNode #OrderedCollection #YAMLListItemNode #SmaCCToken #YAMLmappingsNode #YAMLMappingNode #OrderedCollection #YAMLMappingNode #YAMLIdentNode #YAMLIdentNode #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
YAMLParser class >> transitionTable [
^#(
#[1 0 6 0 1 0 6 0 3 0 6 0 4 0 9 0 9 0 13 0 10] 
#[0 0 0 0 25] 
#[1 0 6 0 1 0 17 0 3 0 6 0 4 0 21 0 10 0 25 0 11 0 25 0 12 0 33 0 13 0 37 0 14 0 25 0 17 0 45 0 18 0 49 0 19] 
#[0 0 10 0 1 0 3 0 4 0 25] 
#[1 0 53 0 1 0 17 0 3 0 57 0 4 0 61 0 15 0 65 0 20 0 69 0 22] 
#[1 0 6 0 3 0 73 0 10 0 6 0 25] 
#[0 0 14 0 3 0 25] 
#[0 0 18 0 1 0 3 0 23 0 25] 
#[1 0 6 0 1 0 6 0 3 0 77 0 10 0 81 0 13 0 22 0 23 0 22 0 25] 
#[0 0 26 0 3 0 25] 
#[0 0 30 0 3 0 4 0 23 0 25] 
#[1 0 34 0 3 0 6 0 4 0 85 0 10 0 89 0 18 0 34 0 23 0 34 0 25] 
#[1 0 101 0 3 0 97 0 4 0 101 0 16 0 105 0 21] 
#[0 0 38 0 2] 
#[1 0 42 0 1 0 109 0 3 0 42 0 23 0 42 0 25] 
#[1 0 113 0 3 0 46 0 4 0 46 0 23 0 46 0 25] 
#[0 0 117 0 2] 
#[1 0 17 0 3 0 50 0 25] 
#[1 0 53 0 1 0 17 0 3 0 61 0 15] 
#[0 0 54 0 1 0 3 0 23 0 25] 
#[1 0 17 0 3 0 57 0 4 0 65 0 20 0 69 0 22] 
#[0 0 58 0 3 0 4 0 23 0 25] 
#[0 0 62 0 3 0 24] 
#[0 0 66 0 1 0 3 0 4 0 23 0 25] 
#[1 0 121 0 3 0 125 0 24] 
#[0 0 70 0 1 0 3 0 23 0 25] 
#[0 0 74 0 1 0 3 0 23 0 25] 
#[0 0 78 0 3 0 4 0 23 0 25] 
#[1 0 129 0 3 0 97 0 4 0 129 0 16 0 133 0 21 0 82 0 23 0 82 0 25] 
#[0 0 86 0 3 0 24] 
#[1 0 6 0 1 0 6 0 3 0 77 0 10 0 137 0 12 0 33 0 13 0 37 0 14] 
#[1 0 121 0 3 0 141 0 24] 
#[0 0 90 0 3 0 4 0 23 0 25] 
#[0 0 145 0 23] 
#[1 0 6 0 3 0 6 0 4 0 85 0 10 0 149 0 17 0 45 0 18 0 49 0 19] 
#[0 0 94 0 1 0 3 0 23 0 25] 
#[0 0 153 0 23] 
#[0 0 98 0 3 0 4 0 23 0 25]
	).
]

{ #category : #'generated-reduction actions' }
YAMLParser >> reduceActionFor__NEWLINE___listItem__listItem___NEWLINE____1: nodes [
	| result |
	result := OrderedCollection new: 2.
	self add: (nodes at: 1) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
YAMLParser >> reduceActionFor__NEWLINE___listItem__listItem___NEWLINE____2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
YAMLParser >> reduceActionForfile1: nodes [
	| result |
	result := YAMLFileNode new.
	result document: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
YAMLParser >> reduceActionForkey1: nodes [
	| result |
	result := YAMLIdentNode new.
	result ident: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
YAMLParser >> reduceActionForlist1: nodes [
	| result |
	result := YAMLlistItemsNode new.
	result addNodes: (nodes at: 1) to: result listItems.
	^ result
]

{ #category : #'generated-reduction actions' }
YAMLParser >> reduceActionForlistItem1: nodes [
	| result |
	result := YAMLListItemNode new.
	result value: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
YAMLParser >> reduceActionForlistItem2: nodes [
	| result |
	result := YAMLListItemNode new.
	result list: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
YAMLParser >> reduceActionFormapping1: nodes [
	| result |
	result := YAMLMappingNode new.
	result key: (nodes at: 1).
	result mappingList: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
YAMLParser >> reduceActionFormapping2: nodes [
	| result |
	result := YAMLMappingNode new.
	result key: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
YAMLParser >> reduceActionFormapping3: nodes [
	| result |
	result := YAMLMappingNode new.
	result key: (nodes at: 1).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
YAMLParser >> reduceActionFormappingList1: nodes [
	| result |
	result := YAMLmappingsNode new.
	result addNodes: (nodes at: 1) to: result mappings.
	^ result
]
