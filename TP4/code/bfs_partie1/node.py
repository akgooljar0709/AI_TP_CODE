from collections import deque

def bfs(graph, start_node, target_node):
    visited = set()
    queue = deque([(start_node, [])])

    while queue:
        current_node, path = queue.popleft()
        if current_node == target_node:
            return path + [current_node]

        if current_node not in visited:
            visited.add(current_node)
            neighbors = graph[current_node]
            for neighbor in neighbors:
                queue.append((neighbor, path + [current_node]))

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

result = bfs(graph, start_node, target_node)

if result:
    print(f"Path from {start_node} to {target_node}: {' -> '.join(result)}")
else:
    print(f"No path found from {start_node} to {target_node}")
