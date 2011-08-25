class Assignment < ActiveRecord::Base

  belongs_to :allocation_tag

  has_many :files_enunciations
  has_many :send_assignments

  # Recupera as atividades por turma
  def self.all_by_group_id(group_id)
    ActiveRecord::Base.connection.select_all <<SQL
    SELECT t1.id,
           t1.name,
           t1.start_date,
           t1.end_date
      FROM assignments     AS t1
      JOIN allocation_tags AS t2 ON t2.id = t1.allocation_tag_id
     WHERE t2.group_id = #{group_id}
     ORDER BY t1.start_date;
SQL
  end

  # Recupera status da atividade
  def self.status_of_actitivy_by_assignment_id_and_student_id(assignment_id, student_id)
    status_assignment = ActiveRecord::Base.connection.select_all <<SQL
    SELECT
           CASE
            WHEN t1.start_date > now() THEN 'not_started'
            WHEN t2.grade IS NOT NULL THEN 'corrected'
            WHEN COUNT(t3.id) > 0 THEN 'sent'
            WHEN COUNT(t3.id) = 0 AND t1.end_date > now() THEN 'send'
            ELSE '-'
           END AS assignment_status
      FROM assignments      AS t1
 LEFT JOIN send_assignments AS t2 ON t2.assignment_id = t1.id AND t2.user_id = #{student_id}
 LEFT JOIN assignment_files AS t3 ON t3.send_assignment_id = t2.id
     WHERE t1.id = #{assignment_id}
     GROUP BY t1.id, t2.id, t1.start_date, t1.end_date, t2.grade;
SQL

    return (status_assignment.first.nil?) ? '-' : status_assignment.first['assignment_status']
  end

end
