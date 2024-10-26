Problem.create!(
  [
    {
      title: '少子高齢化',
      content: '日本の少子高齢化問題について、グラフから読み取り、あなたの考えを書こう。',
      image: 'problem1.png'
    },
    {
      title: '地球温暖化',
      content: '地球温暖化の原因について、図を参考にして、あなたの考えを書こう。',
      image: 'problem2.png'
    }
  ]
)

User.create!(
  [
    {
      name: 'アオイ',
    },
    {
      name: 'タロウ'
    }
  ]
)

Post.create!(
  [
    {
      problem_id: 1,
      user_id: 2,
      content: '幸せになろう！'
    },
    {
      problem_id: 1,
      user_id: 1,
      content: '幸せになれるかな'
    }
  ]
)