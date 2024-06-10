const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');
const mysql = require('mysql');
const app = express();

// Set up body parser
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// Set up MySQL connection
const db = mysql.createConnection({
    host: 'localhost',
    user: 'naveen',
    password: 'Naveen@2004',
    database: 'ott'
});

db.connect(err => {
    if (err) {
        console.error('Error connecting to the database:', err.stack);
        return;
    }
    console.log('Connected to the database.');
});

// Serve the registration form
app.get('/index', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

// Serve the login form
app.get('/login', (req, res) => {
    res.sendFile(path.join(__dirname, 'login.html'));
});
app.get('/home', (req, res) => {
    res.sendFile(path.join(__dirname, 'home.html'));
});

// Serve the subscription form
app.get('/subscription', (req, res) => {
    res.sendFile(path.join(__dirname, 'subscription.html'));
});

// Serve the payment form
app.get('/payment', (req, res) => {
    res.sendFile(path.join(__dirname, 'payment.html'));
});
// Serve the search form
app.get('/search', (req, res) => {
    res.sendFile(path.join(__dirname, 'search.html'));
});
// Serve the TV show search form
app.get('/search-tv', (req, res) => {
    res.sendFile(path.join(__dirname, 'search-tv.html'));
});
// Serve the Documentary search form
app.get('/search-documentary', (req, res) => {
    res.sendFile(path.join(__dirname, 'search-documentary.html'));
});
app.get('/search-artists', (req, res) => {
    res.sendFile(path.join(__dirname, 'search-artists.html'));
});
// serve the delete subscription 
app.get('/delete-subscription', (req, res) => {
    res.sendFile(path.join(__dirname, 'delete-subscription.html'));
});
// serve the delete user 
app.get('/delete-user', (req, res) => {
    res.sendFile(path.join(__dirname, 'delete-user.html'));
});
app.get('/update-user', (req, res) => {
    res.sendFile(path.join(__dirname, 'update-user.html'));
});
 

// Route to handle login
app.post('/login', (req, res) => {
    const { username, password } = req.body;

    if (!username || !password) {
        res.status(400).json({ success: false, message: 'Username and password are required.' });
        return;
    }

    const query = 'SELECT * FROM OTTuser2 WHERE User_Name = ? AND password = ?';
    db.query(query, [username, password], (err, results) => {
        if (err) {
            console.error('Error querying data:', err.stack);
            res.status(500).json({ success: false, message: 'An error occurred.' });
            return;
        }

        if (results.length > 0) {
            res.status(200).json({ success: true, message: 'Login successful!' });
            
        } else {
            res.status(401).json({ success: false, message: 'Invalid username or password.' });
        }
    });
});


// Route to handle artist search
app.post('/search-artist', (req, res) => {
    const { artistName } = req.body;

    if (!artistName) {
        res.status(400).json({ success: false, message: 'Artist name is required.' });
        return;
    }

    const searchQuery = `
        SELECT * FROM artists WHERE name LIKE ?
    `;
    db.query(searchQuery, [`%${artistName}%`], (err, results) => {
        if (err) {
            console.error('Error fetching artists:', err.stack);
            res.status(500).json({ success: false, message: 'An error occurred.' });
            return;
        }

        if (results.length > 0) {
            res.status(200).json({ success: true, artists: results });
        } else {
            res.status(404).json({ success: false, message: 'No artists found.' });
        }
    });
});



// Search for movies based on user query
app.get('/search-movies', (req, res) => {
    const { query } = req.query;

    const searchQuery = `
        SELECT * FROM movies WHERE name LIKE ?
    `;

    db.query(searchQuery, [`%${query}%`], (err, results) => {
        if (err) {
            console.error('Error fetching movies:', err.stack);
            res.status(500).send('Error fetching movies.');
            return;
        }
        res.status(200).json(results);
    });
});

// Search for TV shows based on user query
app.get('/search-tv-shows', (req, res) => {
    const { query } = req.query;

    const searchQuery = `
        SELECT * FROM TV_Shows WHERE name LIKE ?
    `;

    db.query(searchQuery, [`%${query}%`], (err, results) => {
        if (err) {
            console.error('Error fetching TV shows:', err.stack);
            res.status(500).send('Error fetching TV shows.');
            return;
        }
        res.status(200).json(results);
    });
});
// Search for Documentaries based on user query
app.get('/search-documentaries', (req, res) => {
    const { query } = req.query;

    const searchQuery = `
        SELECT * FROM Documentary WHERE name LIKE ?
    `;

    db.query(searchQuery, [`%${query}%`], (err, results) => {
        if (err) {
            console.error('Error fetching Documentaries:', err.stack);
            res.status(500).send('Error fetching Documentaries.');
            return;
        }
        res.status(200).json(results);
    });
});

// Handle registration form submission
app.post('/home', (req, res) => {
    const {
        username, age, email, phno, password,
        city, state, street,
        subscription_start_date, subscription_end_date, subscription_id
    } = req.body;

    const query = `
        INSERT INTO OTTUSER2 (
            User_Name, Age, Phone, City, State, Street, Subscription_ID, 
            Subscription_Start_Date, Subscription_End_Date
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;

    db.query(query, [
        username, age, phno, city, state, street, subscription_id,
        subscription_start_date, subscription_end_date
    ], (err, result) => {
        if (err) {
            console.error('Error inserting data:', err.stack);
            res.status(500).send('Error inserting data.');
            return;
        }
        console.log('Registration successful!');
        // res.status(200).send('Registration successful!');
        res.redirect('home');
    });
});

// Handle login form submission
app.post('/login', async (req, res) => {
    const { username, password } = req.body;

    if (!username || !password) {
        res.status(400).json({ success: false, message: 'Username and password are required.' });
        return;
    }

    try {
        const query = 'SELECT * FROM OTTuser2 WHERE User_name = ? AND password = ?';
        const results = await db.query(query, [username, password]);

        if (!results[0] || results[0].length === 0) {
            res.status(401).json({ success: false, message: 'Invalid username or password.' });
            return;
        }

        // If the username and password are correct, send a success response.
        res.status(200).json({ success: true, message: 'Login successful!' });
    } catch (err) {
        console.error('Error querying data:', err.stack);
        res.status(500).json({ success: false, message: 'An error occurred during login.' });
    }
});
// Route to handle subscription deletion
app.post('/delete-subscription', (req, res) => {
    const { subscriptionId } = req.body;

    if (!subscriptionId) {
        res.status(400).json({ success: false, message: 'Subscription ID is required.' });
        return;
    }

    const deleteQuery = 'DELETE FROM Subscription WHERE Subscription_ID = ?';
    db.query(deleteQuery, [subscriptionId], (err, results) => {
        if (err) {
            console.error('Error deleting subscription:', err.stack);
            res.status(500).json({ success: false, message: 'An error occurred.' });
            return;
        }

        if (results.affectedRows > 0) {
            res.status(200).json({ success: true, message: 'Subscription deleted successfully.' });
        } else {
            res.status(404).json({ success: false, message: 'Subscription not found.' });
        }
    });
});
// Route to handle user deletion
app.post('/delete-user', (req, res) => {
    const { userId } = req.body;

    if (!userId) {
        res.status(400).json({ success: false, message: 'User ID is required.' });
        return;
    }

    const deleteUserQuery = 'DELETE FROM OTTUSER2 WHERE id = ?';
    db.query(deleteUserQuery, [userId], (err, results) => {
        if (err) {
            console.error('Error deleting user:', err.stack);
            res.status(500).json({ success: false, message: 'An error occurred.' });
            return;
        }

        if (results.affectedRows > 0) {
            res.status(200).json({ success: true, message: 'User deleted successfully.' });
        } else {
            res.status(404).json({ success: false, message: 'User not found.' });
        }
    });
});

// Route to handle user update
app.post('/update-user', (req, res) => {
    const { userId, userName, age, phone, city, state, street } = req.body;

    if (!userId || !userName || !age || !phone || !city || !state || !street) {
        res.status(400).json({ success: false, message: 'All fields are required.' });
        return;
    }

    const updateUserQuery = `
        UPDATE OTTUSER2 
        SET User_Name = ?, Age = ?, Phone = ?, City = ?, State = ?, Street = ?
        WHERE id = ?
    `;
    db.query(updateUserQuery, [userName, age, phone, city, state, street, userId], (err, results) => {
        if (err) {
            console.error('Error updating user information:', err.stack);
            res.status(500).json({ success: false, message: 'An error occurred.' });
            return;
        }

        if (results.affectedRows > 0) {
            res.status(200).json({ success: true, message: 'User information updated successfully.' });
        } else {
            res.status(404).json({ success: false, message: 'User not found.' });
        }
    });
});


// Handle subscription form submission
app.post('/add-subscription', (req, res) => {
    const { subscription_id, subscription_type, amount } = req.body;

    const query = 'INSERT INTO Subscription (Subscription_ID, Subscription_Type, Amount) VALUES (?, ?, ?)';
    db.query(query, [subscription_id, subscription_type, amount], (err, result) => {
        if (err) {
            console.error('Error inserting data:', err.stack);
            res.status(500).send('Error inserting data.');
            return;
        }
        console.log('Subscription added successfully!');
        res.status(200).send('Subscription added successfully!');
    });
});

// Handle payment form submission
app.post('/add-payment', (req, res) => {
    const {
        payment_id, payment_date, amount_due, user_id,
        p_type, credit_card_no, debit_card_no, net_banking_id, upi_id
    } = req.body;

    const query = `
        INSERT INTO Payment_Type (
            Payment_ID, Payment_Date, Amount_Due, User_ID, P_Type,
            Credit_Card_No, Debit_Card_No, Net_Banking_ID, UPI_ID
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;

    db.query(query, [
        payment_id, payment_date, amount_due, user_id, p_type,
        credit_card_no || null, debit_card_no || null, net_banking_id || null, upi_id || null
    ], (err, result) => {
        if (err) {
            console.error('Error inserting data:', err.stack);
            res.status(500).send('Error inserting data.');
            return;
        }
        console.log('Payment added successfully!');
        res.status(200).send('Payment added successfully!');
    });
});

// Start the server
const PORT = process.env.PORT || 5500;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}.`);
});
