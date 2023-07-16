def dfs(graph, start_node, target_node):
    visited = set()
    return dfs_recursive(graph, start_node, target_node, visited)

def dfs_recursive(graph, current_node, target_node, visited):
    visited.add(current_node)

    if current_node == target_node:
        return [current_node]

    for neighbor in graph[current_node]:
        if neighbor not in visited:
            path = dfs_recursive(graph, neighbor, target_node, visited)
            if path:
                return [current_node] + path

    return None

# Example graph
graph = {
    'a': ['b'],
    'b': ['c', 'd'],
    'c': ['e'],
    'd': ['f'],
    'e': ['g', 'h'],
    'f': ['i'],
    'g': ['i'],
    'h': ['j'],
    'i': [],
    'j': []
}

start_node = 'a'
target_node = 'j'

result = dfs(graph, start_node, target_node)

if result:
    print(f"Path from {start_node} to {target_node}: {' -> '.join(result)}")
else:
    print(f"No path found from {start_node} to {target_node}")
