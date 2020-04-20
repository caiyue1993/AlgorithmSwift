
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
            // 触发结束条件
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
    
}
