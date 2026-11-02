--!strict
-- Original multiple-choice question data for the MVP.
-- IMPORTANT: Keep this ModuleScript under ServerScriptService.
-- Send only id, prompt, choices, difficulty to clients; NEVER correctIndex.

local QuestionBank = {}

QuestionBank.Questions = {
    {
        id = "E01", difficulty = "Easy", topic = "Loops",
        prompt = "What is 1 + 2 + 3?",
        choices = {"3", "6", "7", "9"}, correctIndex = 2,
        explanation = "Adding 1, 2, and 3 gives 6.",
    },
    {
        id = "E02", difficulty = "Easy", topic = "Big O",
        prompt = "A loop visits each of n array elements exactly once. Its time complexity is:",
        choices = {"O(1)", "O(log n)", "O(n)", "O(n^2)"}, correctIndex = 3,
        explanation = "One operation per element scales linearly with n.",
    },
    {
        id = "E03", difficulty = "Easy", topic = "Stacks",
        prompt = "Push 3, then push 8 onto a stack. Which value is popped first?",
        choices = {"3", "8", "11", "Neither"}, correctIndex = 2,
        explanation = "Stacks are last-in, first-out.",
    },
    {
        id = "E04", difficulty = "Easy", topic = "Queues",
        prompt = "A queue receives A, B, C in that order. Which leaves first?",
        choices = {"C", "B", "A", "Random"}, correctIndex = 3,
        explanation = "Queues are first-in, first-out.",
    },
    {
        id = "E05", difficulty = "Easy", topic = "Arrays",
        prompt = "For zero-based arr = [4, 9, 2], what is arr[1]?",
        choices = {"4", "9", "2", "Out of bounds"}, correctIndex = 2,
        explanation = "Zero-based index 1 refers to the second element.",
    },
    {
        id = "E06", difficulty = "Easy", topic = "Two Sum",
        prompt = "With zero-based nums = [2, 7, 11, 15] and target = 9, which pair of indices works?",
        choices = {"(1, 2)", "(0, 1)", "(2, 3)", "(0, 2)"}, correctIndex = 2,
        explanation = "nums[0] + nums[1] = 2 + 7 = 9.",
    },
    {
        id = "M01", difficulty = "Medium", topic = "Binary Search",
        prompt = "In sorted [1, 3, 5, 7, 9], searching for 7 with low=0 and high=4, mid=2 gives 5. What should low become?",
        choices = {"0", "1", "2", "3"}, correctIndex = 4,
        explanation = "Since 5 is less than 7, search the right half starting at mid + 1 = 3.",
    },
    {
        id = "M02", difficulty = "Medium", topic = "Big O",
        prompt = "Two independent loops each run n times, one nested inside the other. Complexity?",
        choices = {"O(n)", "O(log n)", "O(n^2)", "O(2^n)"}, correctIndex = 3,
        explanation = "The nested loops execute n*n iterations.",
    },
    {
        id = "M03", difficulty = "Medium", topic = "Sliding Window",
        prompt = "What is the maximum sum of 3 consecutive numbers in [2, -1, 4, 5]?",
        choices = {"5", "7", "8", "11"}, correctIndex = 3,
        explanation = "Windows have sums 5 and 8; the maximum is 8.",
    },
    {
        id = "M04", difficulty = "Medium", topic = "Graph Algorithms",
        prompt = "Which algorithm finds shortest paths in an unweighted graph?",
        choices = {"DFS", "BFS", "Merge sort", "Binary search"}, correctIndex = 2,
        explanation = "Breadth-first search explores the graph layer by layer.",
    },
    {
        id = "M05", difficulty = "Medium", topic = "Hash Sets",
        prompt = "Which approach checks an array for duplicates in expected O(n) time?",
        choices = {"Sort with bubble sort", "Compare every pair", "Insert into a hash set", "Try every subset"}, correctIndex = 3,
        explanation = "An average O(1) lookup per element gives expected O(n) total time.",
    },
    {
        id = "M06", difficulty = "Medium", topic = "Binary Search",
        prompt = "What is the zero-based lower_bound index of 2 in sorted [1, 2, 2, 4]?",
        choices = {"0", "1", "2", "3"}, correctIndex = 2,
        explanation = "lower_bound returns the first position with a value >= 2, index 1.",
    },
}

-- usedIds is a dictionary such as {E01 = true}; pass per player and reset every match.
function QuestionBank.GetRandom(difficulty: string, usedIds: {[string]: boolean}?, rng: Random?)
    local available = {}
    local alreadyUsed = usedIds or {}
    for _, question in ipairs(QuestionBank.Questions) do
        if question.difficulty == difficulty and not alreadyUsed[question.id] then
            table.insert(available, question)
        end
    end
    if #available == 0 then
        return nil
    end
    local random = rng or Random.new()
    return available[random:NextInteger(1, #available)]
end

-- Utility for constructing a safe question payload to send to the client.
function QuestionBank.ToClientPayload(question)
    return {
        id = question.id,
        difficulty = question.difficulty,
        topic = question.topic,
        prompt = question.prompt,
        choices = table.clone(question.choices),
    }
end

return QuestionBank
