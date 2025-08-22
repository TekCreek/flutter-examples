import { Router } from 'express';
const router = Router();
import db from '../db.js';
import auth from '../middleware/auth.js';

// Create Post
router.post('/', auth, async (req, res) => {
  const { title, description } = req.body;
  const userId = req.user.userId;
  try {
    await db.execute(
      'INSERT INTO posts (title, description, userId) VALUES (?, ?, ?)',
      [title, description, userId]
    );
    res.status(201).json({ message: 'Post created' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Get all posts for logged-in user
router.get('/', auth, async (req, res) => {
  const userId = req.user.userId;
  try {
    const [posts] = await db.execute('SELECT * FROM posts WHERE userId=?', [userId]);
    res.json(posts);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Get single post (user owned)
router.get('/:id', auth, async (req, res) => {
  const userId = req.user.userId;
  try {
    const [posts] = await db.execute(
      'SELECT * FROM posts WHERE postId=? AND userId=?',
      [req.params.id, userId]
    );
    if (!posts.length)
      return res.status(404).json({ message: 'Not found or unauthorized' });
    res.json(posts[0]);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Update post (user owned)
router.put('/:id', auth, async (req, res) => {
  const userId = req.user.userId;
  const { title, description } = req.body;
  try {
    const [result] = await db.execute(
      'UPDATE posts SET title=?, description=? WHERE postId=? AND userId=?',
      [title, description, req.params.id, userId]
    );
    if (result.affectedRows === 0)
      return res.status(404).json({ message: 'Not found or unauthorized' });
    res.json({ message: 'Post updated' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Delete post (user owned)
router.delete('/:id', auth, async (req, res) => {
  const userId = req.user.userId;
  try {
    const [result] = await db.execute(
      'DELETE FROM posts WHERE postId=? AND userId=?',
      [req.params.id, userId]
    );
    if (result.affectedRows === 0)
      return res.status(404).json({ message: 'Not found or unauthorized' });
    res.json({ message: 'Post deleted' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

export default router;
