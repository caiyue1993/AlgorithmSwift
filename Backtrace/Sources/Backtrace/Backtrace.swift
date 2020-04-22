
// 全排列的例子

struct Backtrace {
    func permute(_ nums: [Int]) -> [[Int]] {
        
        var results: [[Int]] = []
        
        /// 每次用来记录的路径
        var track: [Int] = []
        
        /// - Parameters:
        ///   - nums: 全排列的初数组
        ///   - track: 当前的路径
        func backtrace(_ nums: [Int], _ track: inout [Int]) {
            /// 触发结束条件
            if track.count == nums.count {
                results.append(track)
                return
            }
            
            var i = 0
            while (i < nums.count) {
                if track.contains(nums[i]) {
                    i = i + 1
                    continue
                }
                track.append(nums[i])
                backtrace(nums, &track)
                track.removeLast()
                
                i = i + 1
            }
        }
        
        backtrace(nums, &track)
        return results
    }
    
    /// Given: [1, 1, 2] which means could duplicate
    /// Output: [1, 1, 2], [1, 2, 1], [2, 1, 1]
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        var track: [Int] = []
        var isVisited: [Bool] = Array(repeating: false, count: nums.count)
           
        let sortedNums = nums.sorted() // 需要先对数组进行排序
           
        func backtrack(nums: [Int], _ track: inout [Int], _ isVisited: inout [Bool]) {
            if track.count == nums.count {
                results.append(track)
                return
            }
           
            var i = 0
            while (i < nums.count) {
                if isVisited[i] {
                    // 如果之前的已经访问了，那么不再使用，与 permute 相比，permute 是通过 contains 来判断是否已访问的
                    // 所以说 permute 的 contains 优化程度不够，也可以通过这种 isVisited 这种方式来用空间换时间
                    i = i + 1
                    continue
                }
                if (i > 0 && !isVisited[i-1] && nums[i-1] == nums[i]) {
                    // 由于我们的 nums 是排过序的，所以如果当前节点和 sibling 一样
                    // 并且一定得是 !isVisited[i-1]，表示是 sibling（由于是排序的所以 i-1 用来表示上一个 sibling，如果是已经 visit 过的，那么再加入进来是应该的
                    i = i + 1
                    continue
                }
                track.append(nums[i])
                isVisited[i] = true
                backtrack(nums: nums, &track, &isVisited)
                track.removeLast()
                isVisited[i] = false
                
                i = i + 1
           }
       }
           
        backtrack(nums: sortedNums, &track, &isVisited)
        return results
    }
}
