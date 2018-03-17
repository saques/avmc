one sig List { //only one list
	head : lone Node
}

sig Node {
	nnext : lone Node,
	value : Int
}

fact {
	all n : Node | n in List.head.*nnext implies n !in n.^nnext	
}

run{
	#List.head.*nnext = 5
} for 5

//Should fail, this constraint is defined for all posible nodes
assert acyclic2 {^nnext & iden = none -> none}

check acyclic2 for 5
