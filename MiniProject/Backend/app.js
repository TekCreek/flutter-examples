const express = require('express');
const bodyParser = require('body-parser');
const userRoutes = require('./routes/users');
const postRoutes = require('./routes/posts');
const auth = require('./middleware/auth');
const cors = require('cors');

const app = express();

app.use(cors());
app.use(bodyParser.json());

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
