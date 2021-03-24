/*
 * @lc app=leetcode.cn id=257 lang=javascript
 *
 * [257] 二叉树的所有路径
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} root
 * @return {string[]}
 */
var binaryTreePaths = function(root) {
  if (!root) return [];

  const paths = [];
  function constructPath(root, path) {
    if (root) {
      path += root.val.toString();
      if (root.left === null && root.right === null){
        paths.push(path);
      } else {
        path += '->';
        constructPath(root.left, path);
        constructPath(root.right, path);
      }
    }
  }
  constructPath(root, '');
  return paths;
};
// @lc code=end

