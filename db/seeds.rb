School.find_or_create_by!(id: 100, name: 'サンプル小学校')
ClassRoom.find_or_create_by!(id: 100, school_id: 100, grade: 6, class_number: 1, class_goals: '学級目標(サンプル)')