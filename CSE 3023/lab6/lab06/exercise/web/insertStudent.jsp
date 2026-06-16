<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert Student</title>
    </head>
    <body>

        <h1>Lab 6 - Task 3 - Student Registration</h1>

        <form action="processStudent.jsp" method="post">
            <table>
                <tr>
                    <td>Student ID</td>
                    <td><input type="text" name="stuno" placeholder="e.g UK88888" required></td>
                </tr>

                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" required></td>
                </tr>

                <tr>
                    <td>Program</td>
                    <td>
                        <select name="program" required>
                            <option value="">Select Program</option>
                            <option value="BSc. with IM">BSc. with IM</option>
                            <option value="BSc. Soft. Eng.">BSc. Soft. Eng.</option>
                            <option value="BSc. in Networking">BSc. in Networking</option>
                            <option value="BSc. in Robotics">BSc. in Robotics</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <input type="submit" value="Submit">
                        <input type="reset" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>

    </body>
</html>