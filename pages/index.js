import Head from "next/head";
import styles from "../styles/Home.module.css";

export default function Home(data) {
  const envVars = Object.entries(JSON.parse(data.env));
  const generateUniqueKey = () => {
    return "_" + Math.random().toString(36).substring(2, 9);
  };

  return (
    <div className={styles.container}>
      <Head>
        <title>Create Next App</title>
        <meta name="description" content="Generated by create next app" />
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <main className={styles.main}>
        <h1 className={styles.title}>Welcome to my app!</h1>
        <div className={styles.code}>
          <h1>Environment variables in the container</h1>
          <ul>
            {envVars.map(item => {
              return (
                <li key={generateUniqueKey()}>
                  {item[0]} : {item[1]}
                </li>
              );
            })}
          </ul>
        </div>
      </main>

      <footer className={styles.footer}>Sample app</footer>
    </div>
  );
}

export async function getServerSideProps() {
  return {props: {env: JSON.stringify(process.env)}};
}
