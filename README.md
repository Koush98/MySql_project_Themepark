cd <repository_name>
echo "
# ABCSolutions Database Setup

This project contains SQL scripts to create and manage the \`ABCSolutions\` database, including tables with various constraints and foreign key relationships.

## Getting Started

1. Clone the repository:
   \`\`\`sh
   git clone https://github.com/Koush98/ABCSolutions-Database-Sql_Tables.git
   \`\`\`

2. Navigate to the project directory:
   \`\`\`sh
   cd ABCSolutions-Database
   \`\`\`

3. Use the provided SQL script to create the database and tables. You can execute the script using a MySQL client like MySQL Workbench or the MySQL command line:
   \`\`\`sh
   mysql -u <username> -p <database_name> < script.sql
   \`\`\`

## Tables and Constraints

The following tables are created in the \`ABCSolutions\` database:

- \`countries\`
- \`jobs\`
- \`departments\`
- \`employees\`
- \`job_history\`

Each table includes various constraints such as \`NOT NULL\`, \`PRIMARY KEY\`, \`UNIQUE\`, \`CHECK\`, and foreign key relationships.

## PDF Documentation

A PDF file (\`sql_script.pdf\`) is included in this repository, which contains the SQL script for reference.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
" > README.md
