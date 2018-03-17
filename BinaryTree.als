one sig Tree {
	root: TreeNode
}

sig TreeNode {
	left: lone TreeNode,
	right: lone TreeNode,
	height: one Int
} {
	this.@height = add[1, larger[no this.@left => 0 else left.@height, no this.@right => 0 else right.@height]]
	
}



fact {
	all x : TreeNode | x in Tree.root.*(left + right) implies( x !in x.^(left + right)  and ( #(x.left.*(left+right) & x.right.*(left+right)) = 0))
	
	//Perfectly balanced tree
	//all x : TreeNode | x in Tree.root.*(left + right) implies (#x.left.*(left+right) = #x.right.*(left+right))

	//AVL Tree
	all x : TreeNode | minus[no x.left => 0 else x.left.height, no x.right => 0 else x.right.height] in (-1 + 0 + 1)

	//These facts are just here for prettier visualizations
	all x : TreeNode |  x in Tree.root.*(left + right)
}

run{ } for 7
