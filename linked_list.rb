class Node
	attr_accessor :value, :next, :previous

  def initialize(value)
    @value = value
    @next = nil
    @previous = nil
  end

end

class LinkedList
	attr_reader :head, :back, :length

  def initialize(head)
	  @head = head
	  @back = @head
	  @length = 1
  end

  def insert_after(existing_node, node_to_add)
  	if existing_node == @back
  		@back = node_to_add
  	end
    existing_node.next, node_to_add.previous = node_to_add, existing_node
    @length += 1
  end

  def insert_before(existing_node, node_to_add)
    if @head == existing_node
    	new_head(existing_node, node_to_add)
    else
    	node_to_add.previous = existing_node.previous
    	existing_node.previous.next = node_to_add
      existing_node.previous, node_to_add.next = node_to_add, existing_node

    end

    @length += 1
  end

  def remove(node_to_remove)
  	return remove_head if node_to_remove == @head
  	return remove_back if node_to_remove == @back
    node = @head
    until node == nil
	    if node == node_to_remove
	      node_to_remove.previous.next = node_to_remove.next
	      node_to_remove.next.previous = node_to_remove.previous
	      @length -= 1

	      return node
	    end

		  node = node.next
    end

    # if node not found
    return nil
  end

  def remove_head
  	@head = @head.next
  	@head.previous = nil
    @length -= 1
  end

  def remove_back
  	@back = @back.previous
  	@back.next = nil
    @length -= 1
  end

  def new_head(existing_node, node_to_add)
    @head = node_to_add
    @head.next = existing_node
  end

  def print_list
  	node = @head
  	until node == nil
  		puts node.value
  		node = node.next
  	end
  end

end
