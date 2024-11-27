<?php
$quiz_title = "PHP Quiz";

$question = [
    [
        "question" => "What does PHP stand for?",
        "options" => ["Personal Home Page", "HomePage", "PHP: Hypertext Preprocessor", "fghgfhgh"],
        "answer" => "2"
    ],
    [
        "question" => "What is PHP used for?",
        "options" => ["Game Development", "Web Development", "Desktop Applications", "Mobile Apps"],
        "answer" => "1"
    ],
    [
        "question" => "Which of the following is a PHP framework?",
        "options" => ["Laravel", "React", "Django", "Spring"],
        "answer" => "0"
    ],
    [
        "question" => "Which symbol is used to start a PHP variable?",
        "options" => ["@", "$", "&", "%"],
        "answer" => "1"
    ],
    [
        "question" => "Which function is used to output data in PHP?",
        "options" => ["echo", "print", "write", "show"],
        "answer" => "0"
    ]
];

$score = 0;

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $startTime = $_POST['start_time'];
    $endTime = microtime(true);
    $timeTaken = $endTime - $startTime;

    foreach ($question as $index => $q) {
        if (isset($_POST["question$index"]) && $_POST["question$index"] === $q['answer']) {
            $score++;
        }
    }

    $servername = 'localhost';
    $username = 'root';
    $password = 'root';
    $database = 'quiz_app';

    $conn = new mysqli($servername, $username, $password, $database);
    if ($conn->connect_error) {
        die("Database connection failed: " . $conn->connect_error);
    }

    $name = $conn->real_escape_string($_POST['name']);
    $sql = "INSERT INTO leaderboard (name, score, time_taken) VALUES ('$name', $score, $timeTaken)";
    if (!$conn->query($sql)) {
        die("Error inserting data: " . $conn->error);
    }

    echo "<div class='center'>";
    echo "<h2>Your score: $score/" . count($question) . "</h2>";
    echo "<h3>Time Taken: " . number_format($timeTaken, 2) . " seconds</h3>";
    echo "<a href='index2.php'>Try Again?</a>";

    $result = $conn->query("SELECT name, score, time_taken FROM leaderboard ORDER BY score DESC, time_taken ASC LIMIT 10");
    if ($result === false) {
        die("Error fetching leaderboard: " . $conn->error);
    }

    echo "<h3>Leaderboard:</h3>";
    echo "<table border='1' cellspacing='5' cellpadding='10'>";
    echo "<tr><th>Name</th><th>Score</th><th>Time Taken (seconds)</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>{$row['name']}</td>";
        echo "<td>{$row['score']}</td>";
        echo "<td>" . number_format($row['time_taken'], 2) . "</td>";
        echo "</tr>";
    }
    echo "</table>";
    echo "</div>";

    $conn->close();
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $quiz_title; ?></title>
    <script>
        let startTime = null;

        function startGame() {
            const name = document.getElementById('name').value.trim();

            if (name === "") {
                alert("Please enter your name to start the game.");
                return;
            }

            if (confirm("Are you ready to start the quiz, " + name + "?")) {
                startTime = new Date().getTime() / 1000;
                document.getElementById('start_time').value = startTime;

                document.getElementById('start_button').disabled = true;
                document.getElementById('quiz_questions').style.display = 'block';
            }
        }

        window.onload = function () {
            document.getElementById('start_button').addEventListener('click', startGame);

            setInterval(function () {
                if (startTime) {
                    let currentTime = new Date().getTime() / 1000;
                    let elapsedTime = Math.floor(currentTime - startTime);

                    let minutes = Math.floor(elapsedTime / 60);
                    let seconds = elapsedTime % 60;

                    document.getElementById('timer').textContent = `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
                }
            }, 1000);
        };
    </script>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
            font-family: Arial, sans-serif;
            margin: 0;
        }
        #timer {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
        }
        ol {
            padding-left: 20px;
        }
        ol li {
            margin-bottom: 5px;
        }
        .center {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        table {
            margin-top: 20px;
            border-collapse: collapse;
        }
        table th, table td {
            padding: 10px;
            text-align: center;
        }
        table th {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>
    <h1><?php echo $quiz_title; ?></h1>
    <div id="timer">0:00</div>
    <form action="" method="post" class="center">
        <input type="hidden" id="start_time" name="start_time">
        <label for="name">Your Name:</label>
        <input type="text" id="name" name="name" required><br><br>
        <button type="button" id="start_button">Start Quiz</button>
        <br><br>
        <div id="quiz_questions" style="display: none;">
            <?php foreach ($question as $index => $q): ?>
                <fieldset>
                    <legend><?php echo $q['question']; ?></legend>
                    <?php foreach ($q['options'] as $optionIndex => $option): ?>
                        <label>
                            <input type="radio" name="question<?php echo $index; ?>" value="<?php echo $optionIndex; ?>" required>
                            <?php echo $option; ?>
                        </label><br>
                    <?php endforeach; ?>
                </fieldset><br>
            <?php endforeach; ?>
            <button type="submit" name="submit">SUBMIT</button>
        </div>
    </form>
</body>
</html>
