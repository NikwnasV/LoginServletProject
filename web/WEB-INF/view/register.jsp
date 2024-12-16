<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Here!</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.5.0/remixicon.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Work Sans', sans-serif;
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #360427, #3f1a8a, #3a0969);
            background-size: cover;
            background-position: center;
            color: #fff;
        }

        form {
            font-family: 'Work Sans', sans-serif;
            background: rgba(255, 255, 255, 0.1); /* Glass-like background */
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            width: 350px;
            text-align: center;
        }

        .imgcontainer {
            margin-bottom: 20px;
        }

        .imgcontainer svg {
            width: 100px;
            height: 100px;
            color: #fff;
            background: linear-gradient(135deg, #6A1B9A, #f05b2e);
            border-radius: 50%;
            padding: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4);
        }

        .container {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        label {
            font-family: 'Work Sans', sans-serif;
            font-size: 14px;
            font-weight: 600;
            text-align: left;
            color: #ddd;
        }

        input {
            padding: 10px;
            border: none;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 8px;
            color: #fff;
            font-size: 14px;
        }

        input::placeholder {
            color: #e0e0e0;
            font-family: 'Work Sans', sans-serif;
            font-weight: 300;
        }

        input:focus {
            outline: none;
            box-shadow: 0 0 8px rgba(103, 58, 183, 0.8);
            border: 1px solid rgba(255, 255, 255, 0.4);
        }

        button {
            background: linear-gradient(to right, #f05b2e, #AB47BC);
            color: white;
            border: none;
            padding: 10px;
            border-radius: 40px;
            width: 230px;
            align-self: center;
            cursor: pointer;
            font-family: 'Work Sans', sans-serif;
            font-size: 24px;
            font-weight: 600;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.4);
        }

        button:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 10px rgba(171, 71, 188, 0.5);
            background: linear-gradient(to right, #AB47BC, #CE93D8);
        }
    </style>
</head>
<body>
    <form action="/register" method="post">
        <div class="imgcontainer">
            <svg width="150px" height="150px" viewBox="0 -5 72 72" id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><defs><style>.cls-1{fill:#d9d9d9;}</style></defs><title>user-graduate</title><path class="cls-1" d="M17.25,52h37.5A1.68,1.68,0,0,0,56,51.44a1.39,1.39,0,0,0,.34-1.1A20.65,20.65,0,0,0,45.51,34.73a13.42,13.42,0,0,1-19,0A20.65,20.65,0,0,0,15.63,50.34a1.39,1.39,0,0,0,.34,1.1A1.68,1.68,0,0,0,17.25,52Z"></path><path class="cls-1" d="M45.58,18.55l-.67.32-7.37,3.19a5.29,5.29,0,0,1-3.7,0l-7.3-3.17-.26-.12a11.66,11.66,0,0,0,.64,13.78c.2.25.41.48.63.71s.45.45.68.66a11.62,11.62,0,0,0,15.54,0c.23-.21.46-.43.68-.66s.43-.46.63-.71a11.66,11.66,0,0,0,.5-14Z"></path><path d="M50.8,22.39h2.48l-.89-2.89v-9c.6-.41.43-.91-.45-1.22l-14.13-5A6.41,6.41,0,0,0,34,4.3L19.51,9.77c-1.05.39-1.05,1,0,1.43l5.19,2v1A3.32,3.32,0,0,0,26.54,17l7.3,3.18a5.35,5.35,0,0,0,3.7,0L44.91,17a3.32,3.32,0,0,0,1.85-2.82V13l4.89-2.06v8.64Z"></path></g></svg>
        </div>
        <div class="container">
            <label for="email">Email</label>
            <input type="text" placeholder="Enter Email" name="email" id="email" required>
            <label for="uname">Username</label>
            <input type="text" placeholder="Enter Username" name="uname" id="uname" required>
            
            <label for="psw">Password</label>
            <input type="password" placeholder="Enter Password" name="psw" id="psw" required>
            
            <button type="submit">Register</button>
            
        </div>
    </form>
</body>
</html>