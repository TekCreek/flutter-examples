import express from 'express';
import pkg from 'body-parser';
const { json } = pkg;

import userRoutes from './routes/users.js';
import postRoutes from './routes/posts.js';
import auth from './middleware/auth.js';
import cors from 'cors';

const app = express();

app.use(cors());
app.use(json());

// Auth middleware applied globally, but excluded for public paths
app.use((req, res, next) => {
  const publicPaths = [
    '/api/users/login',
    '/api/users/signup'
  ];
  if (publicPaths.includes(req.path)) {
    return next(); // Skip auth for public routes
  }
  // For other routes, apply auth middleware
  return auth(req, res, next);
});

app.use('/api/users', userRoutes);
app.use('/api/posts', postRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
